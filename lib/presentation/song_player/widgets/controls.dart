import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../bloc/song_player_bloc.dart';

class ControlsWidget extends StatelessWidget {
  const ControlsWidget({super.key, required this.position, required this.duration, required this.player});
 final Duration position, duration;
 final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(value: position.inSeconds.toDouble(),
          min: 0.0,
          max: duration.inSeconds.toDouble(),
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
              Text(formatDuration(position),style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: context.isDarkMode?Colors.grey: AppColors.darkGrey),),
              Text(formatDuration(duration),style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: context.isDarkMode?Colors.grey: AppColors.darkGrey))
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
                  child:player.playing? const Icon(Icons.pause,color: Colors.white,size: 30,):
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
  }

  String formatDuration(Duration duration){
    final minutes=duration.inMinutes.remainder(60);
    final seconds=duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2,"0")}:${seconds.toString().padLeft(2,"0")}";
  }
}
