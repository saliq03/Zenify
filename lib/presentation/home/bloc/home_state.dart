part of 'home_bloc.dart';



class HomeState extends Equatable{

  final List<SongEntity> songs;
  final Status newsSongsStatus;
  final String message;

  final List<SongEntity> playlist;
  final Status playlistStatus;

  final List<ArtistModel> artists;
  final Status artistStatus;
  const HomeState({
    this.songs= const [],
    this.newsSongsStatus=Status.loading,
    this.message='',
    this.playlist=const [],
    this.playlistStatus=Status.loading,
    this.artists=const [],
    this.artistStatus=Status.loading

});

  HomeState copyWith({List<SongEntity>? songs,Status? newsSongsStatus, String? message,List<SongEntity>? playlist, Status? playlistStatus,List<ArtistModel>? artists, Status? artistStatus }){
    return  HomeState(
      songs: songs?? this.songs,
      newsSongsStatus: newsSongsStatus?? this.newsSongsStatus,
      message: message?? this.message,
      playlist: playlist?? this.playlist,
      playlistStatus: playlistStatus?? this.playlistStatus,
      artists: artists?? this.artists,
      artistStatus: artistStatus?? this.artistStatus


    );
  }

  @override
  List<Object?> get props => [songs,newsSongsStatus,message, playlist,playlistStatus,artists, artistStatus];

}
