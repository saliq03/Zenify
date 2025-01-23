import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/artist_model.dart';
import 'package:spotify/data/sources/songs/songs_firebase_service.dart';
import 'package:spotify/service_locator.dart';

import '../../../business/entities/song.dart';
import '../../models/song.dart';

abstract class ArtistFirebaseService{
  Future<Either> fetchArtists();
  Future<Either> getArtist(String id);
}

class ArtistFirebaseServiceImpl extends ArtistFirebaseService{
  FirebaseFirestore firestore=FirebaseFirestore.instance;

  @override
  Future<Either> fetchArtists() async {
    print("method called\n\n");

      List<ArtistModel> artists=[];
    try{

      var artistSnapshot=await firestore.collection("artists").get();
     for(var artist in artistSnapshot.docs){
       var artistdata=artist.data();
       artists.add(ArtistModel.fromJson(artistdata, [], []));
     }
      return right(artists);
    }
    catch(e){
      return left("An error occurred \n${e.toString()}");
    }


  }

  @override
  Future<Either> getArtist(String id) async{
    print("data source");
    try{

      var artistCollection=firestore.collection("artists").doc(id);
      var artistSnapshot=await artistCollection.get();
      if (!artistSnapshot.exists) {
        return left("Artist not found");
      }
      var artistData = artistSnapshot.data();
      // fetching artist all tracks
      List<SongEntity> songs=[];

      var artistTracksSnapshot=await artistCollection.collection("tracks").get();
      for(var track in artistTracksSnapshot.docs){
        String songId = track['id'];
        var song = await firestore.collection("Songs").doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.id = songId;
        songModel.isFavourite = await sL<SongsFirebaseService>().isFavourite(songId);
        songs.add(songModel.toEntity());
      }

      // fetching artist albums
      List<Albums> albums=[];
      var artistAlbumCollection=artistCollection.collection("album");
      var artistAlbumSnapshot= await artistAlbumCollection.get();
      for(var album in artistAlbumSnapshot.docs){
        var albumData=album.data();
        var albumTracksSnapshot=await artistAlbumCollection.doc(albumData['id']).collection("tracks").get();
        //fetching album tracks
        List<Tracks> albumTracks=[];
        for(var track in albumTracksSnapshot.docs){
          albumTracks.add(Tracks.fromJson(track.data()));
        }

        albums.add(Albums.fromJson(albumData, albumTracks));
      }

      ArtistModel artistModel=ArtistModel.fromJson(artistData!, songs, albums);
       return Right(artistModel);
    } catch(e){
      return left("An error occurred ${e.toString()}");
    }

  }



}