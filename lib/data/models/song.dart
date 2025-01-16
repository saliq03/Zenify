import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/business/entities/song.dart';

class SongModel{
  String id;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String song;
  final String image;
  bool? isFavourite;

  SongModel( {
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.song,
    required this.image,
   required this.isFavourite});

  factory SongModel.fromJson(Map<String, dynamic> json){
    return SongModel(
        title: json['title'],
        artist: json['artist'],
        duration:json['duration'],
        releaseDate: json['releaseDate'],
        song: json['song'],
        image: json['image'],
        id: '',
        isFavourite: null);
  }
}
extension SongModelX on SongModel{
  SongEntity toEntity(){
    return SongEntity(
        id: id,
        title: title,
        artist: artist,
        duration: duration,
        releaseDate: releaseDate,
        song: song,
        image: image,
        isFavourite: isFavourite!);
  }
}