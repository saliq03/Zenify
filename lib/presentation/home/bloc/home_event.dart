part of 'home_bloc.dart';

 class HomeEvent extends Equatable{
  @override
  List<Object?> get props =>[];
 }

 class FetchNewsSongs extends HomeEvent{}
 class GetPlaylist extends HomeEvent{}
 class FetchArtists extends HomeEvent{}
