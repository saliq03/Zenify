import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/business/usecases/song/is_favourite.dart';
import 'package:spotify/data/models/song.dart';
import 'package:spotify/service_locator.dart';

abstract class SongsFirebaseService{
  Future<Either> getNewsSongs();
  Future<Either> getPlaylist();
  Future<Either>addOrRemoveFavourite(String id);
  Future<bool>isFavourite(String id);
  Future<Either> getFavouriteSongs();
  

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
        songModel.id=element.reference.id;
        bool isFavourite= await sL<IsFavouriteUseCase>().call(
          params: element.reference.id);
        songModel.isFavourite=isFavourite;
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
        songModel.id=element.reference.id;
        bool isFavourite= await sL<IsFavouriteUseCase>().call(
            params: element.reference.id);
        songModel.isFavourite=isFavourite;
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    }
    catch(e){

      return const Left('An error occurred, Please try again');
    }
  }

  @override
  Future<Either> addOrRemoveFavourite(String id) async {

    try {
       bool isFavourite;
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var uId = auth.currentUser!.email;

      QuerySnapshot snapshot = await firebaseFirestore.collection("Users").doc(
          uId)
          .collection("Favourites")
          .where('songId', isEqualTo: id)
          .get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.first.reference.delete();
        isFavourite=false;
      }
      else {
        await firebaseFirestore.collection("Users").doc(uId)
            .collection("Favourites").doc(id).set({
          'songId': id,
          'addedDate': Timestamp.now()
        });
        isFavourite=true;
      }
      return Right(isFavourite);
    }catch(e){
      return const Left("an error occured");
    }

  }

  @override
  Future<bool> isFavourite(String id) async {
    try {

      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var uId = auth.currentUser!.email;

      QuerySnapshot snapshot = await firebaseFirestore.collection("Users").doc(uId)
          .collection("Favourites")
          .where('songId', isEqualTo: id)
          .get();
      if (snapshot.docs.isNotEmpty) {
        return true;
      }
      else {
        return false;
      }

    }catch(e){
      return false;
    }
  }

  @override
  Future<Either> getFavouriteSongs() async{
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var snapshot = await firestore.collection("Users").doc(
          auth.currentUser?.email)
          .collection("Favourites").get();
      List<SongEntity> favouriteSongs = await Future.wait(
          snapshot.docs.map((element) async {
            String songId = element['songId'];
            var song = await firestore.collection("Songs").doc(songId).get();
            SongModel songModel = SongModel.fromJson(song.data()!);
            songModel.id = songId;
            songModel.isFavourite = true;
            return songModel.toEntity();
          }).toList());
      return right(favouriteSongs);
    }catch(e){
      return left("An error occurred");
    }
  }

}