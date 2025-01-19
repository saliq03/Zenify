import 'package:dartz/dartz.dart';

abstract class SongRepository{
  Future<Either> getNewsSongs();
  Future<Either> getPlaylist();
  Future<Either>addOrRemoveFavourite(String id);
  Future<bool>isFavourite(String id);
  Future<Either> getFavouriteSongs();
}