part of 'home_bloc.dart';



class HomeState extends Equatable{

  final List<SongEntity> songs;
  final Status status;
  final String message;
  const HomeState({
    this.songs= const [],
    this.status=Status.loading,
    this.message=''
});

  HomeState copyWith({List<SongEntity>? songs,Status? status, String? message}){
    return  HomeState(
    songs: songs?? this.songs,
      status: status?? this.status,
      message: message?? this.message
    );
  }

  @override
  List<Object?> get props => [songs,status,message];

}
