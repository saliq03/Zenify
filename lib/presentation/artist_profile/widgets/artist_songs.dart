import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../../core/configs/theme/app_colors.dart';

class ArtistSongsWidget extends StatelessWidget {
  const ArtistSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Songs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          const SizedBox(height: 20,),
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                // var song=songs[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>SongPlayerPage(songEntity: song,)));
                      },
                      child: Row(children: [
                        Container(
                          height: 42,width: 42,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode?AppColors.darkGrey:const Color(0xffE6E6E6)
                          ),
                          child:  Icon(Icons.play_arrow_rounded,color: context.isDarkMode? const Color(0xff959595):const Color(0xff616161),),
                        ),
                        const SizedBox(width: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Don't Smile At Me",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                            const SizedBox(height: 5,),
                            Text("Billie Eilesh",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ],),
                    ),

                    Row(children: [
                      Text(5.33.toString().replaceAll('.', ':'),style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                      const SizedBox(width: 50,),
                      Icon(Icons.favorite)
                      // FavouriteButton(songEntity: song)
                    ],)
                  ],
                );
              },
              separatorBuilder: (context,index)=> const SizedBox(height: 20,),
              itemCount: 5)
        ],
      ),
    );
  }
}
