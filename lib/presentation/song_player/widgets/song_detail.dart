import 'package:flutter/material.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/widgets/buttons/favourite.dart';

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
      FavouriteButton(songEntity: songEntity)
      ],);
  }
}
