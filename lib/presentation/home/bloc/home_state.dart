part of 'home_bloc.dart';



class HomeState extends Equatable{

  final List<SongEntity> songs;
  final Status newsSongsStatus;
  final String message;

  final List<SongEntity> playlist;
  final Status playlistStatus;
  const HomeState({
    this.songs= const [],
    this.newsSongsStatus=Status.loading,
    this.message='',
    this.playlist=const [],
    this.playlistStatus=Status.loading,
});

  HomeState copyWith({List<SongEntity>? songs,Status? newsSongsStatus, String? message,List<SongEntity>? playlist, Status? playlistStatus }){
    return  HomeState(
      songs: songs?? this.songs,
      newsSongsStatus: newsSongsStatus?? this.newsSongsStatus,
      message: message?? this.message,
      playlist: playlist?? this.playlist,
      playlistStatus: playlistStatus?? this.playlistStatus

    );
  }

  @override
  List<Object?> get props => [songs,newsSongsStatus,message, playlist,playlistStatus];

}
