import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/configs/constants/status.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../song_player/pages/song_player.dart';
import '../bloc/home_bloc.dart';

class NewsSongsWiget extends StatelessWidget {
  const NewsSongsWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        if(state.newsSongsStatus==Status.loading){
          return  SizedBox(
            height: 245,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index){

                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white38),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      )
                  );
                },
                itemCount: 3),
          );
        }
        else if(state.newsSongsStatus==Status.sucess){
          return
            SizedBox(
              height: 245,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    var song=state.songs[index];
                    return songWidget(context, song);
                  },
                  itemCount: state.songs.length),
            );
        }else{
          return const Center(child: Text("Something went wrong",style: TextStyle(color: Colors.white),));
        }

      },
    );
  }
  
  Widget songWidget(BuildContext context,SongEntity song){
    return  GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SongPlayerPage(songEntity: song,)));

      },
       child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(song.image))),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 50,width: 50,
                          transform: Matrix4.translationValues(3,15,0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode?AppColors.darkGrey:const Color(0xffE6E6E6)
                          ),
                          child: const Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(song.title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  Text(song.artist,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
    );
        
  }
}
