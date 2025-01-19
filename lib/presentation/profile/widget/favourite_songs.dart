import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/presentation/song_player/pages/song_player.dart';

import '../../../common/widgets/buttons/favourite.dart';
import '../../../core/configs/constants/status.dart';
import '../bloc/profile_bloc.dart';

class FavouriteSongsWiddget extends StatelessWidget {
  const FavouriteSongsWiddget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {

          if(state.favouritesStatus==Status.loading){
            return ListView.separated(
              shrinkWrap: true,
                itemBuilder: (context,index){
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              height: 60,width: 60,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color:  Colors.white38,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 10,color:  Colors.white38,width: 200,),
                                const SizedBox(height: 5,),
                                Container(height: 6,color:  Colors.white38,width: 100,),
                              ],
                            ),
                          ],),
                          const SizedBox(width: 50,)
                        ],)
                  );
                }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: 4);
          }
          else if(state.favouritesStatus==Status.error){
            return const Text("Something went wrong");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("FAVOURITE SONGS",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              const SizedBox(height: 20,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    var song=state.favourites[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                              MaterialPageRoute(builder: (_)=>SongPlayerPage(songEntity: song)));
                          },
                          child: Row(children: [
                            Container(
                              height: 60,width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:NetworkImage(song.image) )
                              ),
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
                        ),

                        Row(children: [
                          Text(song.duration.toString().replaceAll('.', ':'),style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                          const SizedBox(width: 50,),
                          FavouriteButton(songEntity: song,
                            function: (){
                            context.read<ProfileBloc>().add(RemoveFavouriteSong(index: index));
                          },
                          key: UniqueKey(),)
                        ],)
                      ],
                    );
                  },
                  separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                  itemCount: state.favourites.length),
            ],
          );
        },
      ),
    );
  }
}
