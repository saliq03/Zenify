import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import 'package:spotify/presentation/song_player/bloc/song_player_bloc.dart';
import 'package:spotify/presentation/song_player/widgets/controls.dart';
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
                  return ControlsWidget(
                      position: state.position,
                      duration: state.duration,
                      player: player);
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }


}
