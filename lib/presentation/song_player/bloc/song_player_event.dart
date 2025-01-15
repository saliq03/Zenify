part of 'song_player_bloc.dart';

 class SongPlayerEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadSong extends SongPlayerEvent{
  final SongEntity song;
  LoadSong({required this.song});
  @override
 List<Object> get props=> [song];

}
class UpdatePosition extends SongPlayerEvent{
   final Duration updatedPosition;
  UpdatePosition({required this.updatedPosition});
   @override
   List<Object?> get props => [updatedPosition];

}
class ChangePositon extends SongPlayerEvent{
  final Duration newPosition;

  ChangePositon({required this.newPosition});
  @override
  List<Object?> get props => [newPosition];
}
class PlayOrPause extends SongPlayerEvent{}

