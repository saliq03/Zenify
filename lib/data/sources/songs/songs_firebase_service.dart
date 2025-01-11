import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/data/models/song.dart';

abstract class SongsFirebaseService{
  Future<Either> getNewsSongs();
  Future<Either> getPlaylist();

}

class SongsFirebaseServiceImpl extends SongsFirebaseService{
  @override
  Future<Either> getNewsSongs() async {
    try{
      List<SongEntity> songs=[];
      var snapshot=await FirebaseFirestore.instance.collection("Songs")
          .orderBy("releaseDate",descending: true)
          .limit(4).get();

      for (var element in snapshot.docs) {
        SongModel songModel=SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    }
    catch(e){

      return const Left('An error occured, Please try again');
    }

  }

  @override
  Future<Either> getPlaylist() async{
    try{
      List<SongEntity> songs=[];
      var snapshot=await FirebaseFirestore.instance.collection("Songs")
          .orderBy("releaseDate",descending: true)
          .get();

      for (var element in snapshot.docs) {
        SongModel songModel=SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    }
    catch(e){

      return const Left('An error occurred, Please try again');
    }
  }

}