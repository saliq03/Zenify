import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/artist_model.dart';

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
      var artistCollection=firestore.collection("artists");
      var artistSnapshot=await artistCollection.get();
     for(var artist in artistSnapshot.docs){
       var artistdata=artist.data();
       // fetching artist all tracks
       List<Tracks> tracks=[];

     var artistTracksSnapshot=await artistCollection.doc(artistdata['id']).collection("tracks").get();
      for(var track in artistTracksSnapshot.docs){
        tracks.add(Tracks.fromJson(track.data()));
      }

       // fetching artist albums
       List<Albums> albums=[];
     var artistAlbumCollection=artistCollection.doc(artistdata['id']).collection("album");
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

       artists.add(ArtistModel.fromJson(artistdata, tracks, albums));
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
      List<Tracks> tracks=[];

      var artistTracksSnapshot=await artistCollection.collection("tracks").get();
      for(var track in artistTracksSnapshot.docs){
        tracks.add(Tracks.fromJson(track.data()));
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

      ArtistModel artistModel=ArtistModel.fromJson(artistData!, tracks, albums);
       return Right(artistModel);
    } catch(e){
      return left("An error occurred ${e.toString()}");
    }

  }



}