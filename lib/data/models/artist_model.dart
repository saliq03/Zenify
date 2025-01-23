import 'package:spotify/business/entities/song.dart';
import 'package:spotify/data/models/music_data.dart';

class ArtistModel{
  final String id;
  final String name;
  final String image;
  final String bio;
  final List<SongEntity> allsongs;
  final List<Albums> albums;

  ArtistModel({required this.id, required this.name, required this.image, required this.bio, required this.allsongs, required this.albums});

factory ArtistModel.fromJson(Map<String,dynamic> json,List<SongEntity> allSongs,List<Albums> albums){
  return ArtistModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      bio: json['bio'],
      allsongs: allSongs,
      albums: albums);
}

}

class Tracks{
  final String id;

  Tracks({required this.id});

 factory Tracks.fromJson(Map<String,dynamic> json){
    return Tracks(id: json['id']);
  }

}
class Albums{
final String id;
final String image;
final String name;
final List<Tracks> tracks;

  Albums({required this.id, required this.image, required this.name, required this.tracks});

  factory Albums.fromJson(Map<String, dynamic> json,List<Tracks> tracks){
    return Albums(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        tracks: tracks);
  }
}