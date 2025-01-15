import 'package:flutter/material.dart';
import 'package:spotify/business/entities/song.dart';

class SongDetailWidget extends StatelessWidget {
  const SongDetailWidget({super.key, required this.songEntity});
  final SongEntity songEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(songEntity.title,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
            Text(songEntity.artist,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 20))
          ],

        ),
        IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline_outlined,size: 30,) )
      ],);
  }
}
