part of 'search_bloc.dart';

 class SearchState extends Equatable{
   final Status status;
   final List<SongEntity> songs;
   final List<ArtistModel> artists;

   const SearchState({this.status=Status.loading,
     this.songs=const[],
   this.artists=const[]});

   SearchState copyWith({Status? status,List<SongEntity>? songs,List<ArtistModel>? artists}){
     return SearchState(
       status: status?? this.status,
       songs: songs?? this.songs,
       artists: artists?? this.artists
     );
   }

  @override
  List<Object?> get props => [];

 }

