import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String id;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String song;
  final String image;
  final bool isFavourite;


  SongEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.song,
    required this.image,
    required this.isFavourite});
}