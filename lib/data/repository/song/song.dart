import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/data/sources/songs/songs_firebase_service.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository{
  @override
  Future<Either> getNewsSongs() async {
    return await sL<SongsFirebaseService>().getNewsSongs();
  }

}