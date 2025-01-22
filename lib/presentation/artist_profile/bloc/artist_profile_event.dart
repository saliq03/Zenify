part of 'artist_profile_bloc.dart';

 class ArtistProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
 }
 class FetchArtist extends ArtistProfileEvent{
  final String id;
  FetchArtist({required this.id});
  @override
  List<Object?> get props => [id];

 }
