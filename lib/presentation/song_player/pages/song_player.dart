import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/presentation/song_player/widgets/song_cover.dart';
import 'package:spotify/presentation/song_player/widgets/song_detail.dart';

class SongPlayerPage extends StatelessWidget {
  const SongPlayerPage({super.key,required this.songEntity});
  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title:const Text("Now Playing",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
      action: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded)),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SongCoverWidget(image: songEntity.image),
            const SizedBox(height: 20,),
            SongDetailWidget(songEntity: songEntity)
          ],
        ),
      ),
    );
  }
}
