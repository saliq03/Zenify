import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/data/sources/songs/songs_firebase_service.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository{
  @override
  Future<Either> getNewsSongs() async {
    return await sL<SongsFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlaylist() async{
    return await sL<SongsFirebaseService>().getPlaylist();
  }

  @override
  Future<Either> addOrRemoveFavourite(String id) async{
    return await sL<SongsFirebaseService>().addOrRemoveFavourite(id);
  }

  @override
  Future<bool> isFavourite(String id) async{
    return await sL<SongsFirebaseService>().isFavourite(id);
  }

  @override
  Future<Either> getFavouriteSongs() async{
    return await sL<SongsFirebaseService>().getFavouriteSongs();
  }

}