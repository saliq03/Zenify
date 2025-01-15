import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import 'package:spotify/presentation/song_player/bloc/song_player_bloc.dart';
import 'package:spotify/presentation/song_player/widgets/song_cover.dart';
import 'package:spotify/presentation/song_player/widgets/song_detail.dart';

class SongPlayerPage extends StatefulWidget {
  const SongPlayerPage({super.key, required this.songEntity});

  final SongEntity songEntity;

  @override
  State<SongPlayerPage> createState() => _SongPlayerPageState();
}

class _SongPlayerPageState extends State<SongPlayerPage> {
  final player=AudioPlayer();
  late SongPlayerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SongPlayerBloc(player);
    _bloc.add(LoadSong(song: widget.songEntity));
    player.positionStream.listen((p){
      _bloc.add(UpdatePosition(updatedPosition: p));
    });

  }

  @override
  void dispose() {
    player.dispose();
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: BasicAppbar(
          title: const Text("Now Playing", style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600),),
          action: IconButton(onPressed: () {}, icon: const Icon(
              Icons.more_vert_rounded)),),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SongCoverWidget(image: widget.songEntity.image),
              const SizedBox(height: 20,),
              SongDetailWidget(songEntity: widget.songEntity),
              const SizedBox(height: 20,),
              BlocBuilder<SongPlayerBloc, SongPlayerState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Slider(value: state.position.inSeconds.toDouble(),
                          min: 0.0,
                          max: state.duration.inSeconds.toDouble(),
                          activeColor: context.isDarkMode? Colors.white:AppColors.darkGrey,
                          onChanged: (value){
                            final newPosition = Duration(seconds: value.toInt());
                            context.read<SongPlayerBloc>().add(ChangePositon(newPosition: newPosition));
                          },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(formatDuration(state.position),style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: context.isDarkMode?Colors.grey: AppColors.darkGrey),),
                            Text(formatDuration(state.duration),style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: context.isDarkMode?Colors.grey: AppColors.darkGrey))
                        ],),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.repeat_rounded,color: context.isDarkMode?Colors.grey: AppColors.darkGrey)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,size: 35,color: context.isDarkMode?AppColors.grey:AppColors.darkGrey)),
                            GestureDetector(
                              onTap: (){
                                context.read<SongPlayerBloc>().add(PlayOrPause());
                              },
                              child: Container(
                                height:70,width:70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                                child:player.playing? const Icon(Icons.pause,color: AppColors.darkGrey,size: 30,):
                                const Icon(Icons.play_arrow,color: Colors.white,size: 40,),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,size: 35,color: context.isDarkMode?AppColors.grey:AppColors.darkGrey,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.shuffle,color: context.isDarkMode?Colors.grey: AppColors.darkGrey)),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration){
    final minutes=duration.inMinutes.remainder(60);
    final seconds=duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2,"0")}:${seconds.toString().padLeft(2,"0")}";
  }
}
