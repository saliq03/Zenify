part of 'artist_profile_bloc.dart';
class ArtistProfileState extends Equatable{
  final Status status;
 ArtistModel? artist;
   ArtistProfileState({
    this.status=Status.loading,
    this.artist
   });
   ArtistProfileState copyWith({Status? status, ArtistModel? artist}){
     return ArtistProfileState(
       status: status?? this.status,
       artist: artist?? this.artist,
     );
   }
  @override
  List<Object?> get props => [status,artist];

}


