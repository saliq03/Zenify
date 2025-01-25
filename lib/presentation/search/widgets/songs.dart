import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/business/entities/song.dart';

class SongsWidget extends StatelessWidget {
   SongsWidget({super.key,required this.songs});
  List<SongEntity> songs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          SongEntity song=songs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(width: 50,height: 50,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:NetworkImage(song.image) )
                  ),),
                const SizedBox(width: 10,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.6,
                      child: Text(song.title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),maxLines: 1, // Limit to a single line
                          overflow: TextOverflow.ellipsis),
                    ),
                    const Text("Song",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],)
              ],
            ),
          );
        }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: songs.length);
  }
}
