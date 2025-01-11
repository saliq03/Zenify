import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/constants/status.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../bloc/home_bloc.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return  Padding(
       padding: const EdgeInsets.only(left: 10,right: 10,top: 37),
       child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          if(state.playlistStatus==Status.loading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state.playlistStatus==Status.sucess){
            return Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Playlist",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    Text("See More",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: context.isDarkMode? const Color(0xffC6C6C6) : const Color(0xff131313)),)
                  ],),
                const SizedBox(height: 20,),
                _songs(state.playlist)
              ],
            );
          }else{
            return const Center(child: Text("Something went wrong",style: TextStyle(color: Colors.white),));
          }

        },
           ),
     );
  }
  Widget _songs(List<SongEntity> songs){
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          var song=songs[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  height: 50,width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode?AppColors.darkGrey:const Color(0xffE6E6E6)
                  ),
                  child:  Icon(Icons.play_arrow_rounded,color: context.isDarkMode? const Color(0xff959595):const Color(0xff616161),),
                ),
                const SizedBox(width: 10,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.title,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                    const SizedBox(height: 5,),
                    Text(song.artist,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                  ],
                ),
              ],),

              Row(children: [
                Text(song.duration.toString().replaceAll('.', ':'),style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                const SizedBox(width: 50,),
                IconButton(onPressed: (){}, icon:   Icon(Icons.favorite,color: context.isDarkMode? const Color(0xff565656): const Color(0xffB4B4B4),size: 30,))
              ],)
             ],
          );
        },
        separatorBuilder: (context,index)=> const SizedBox(height: 20,),
        itemCount: songs.length);
  }
}
