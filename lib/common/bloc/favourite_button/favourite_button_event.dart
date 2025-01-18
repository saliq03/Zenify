part of 'favourite_button_bloc.dart';
 class FavouriteButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
 }
 class AddOrRemoveFavourite extends FavouriteButtonEvent{
  final String id;
  AddOrRemoveFavourite({required this.id});
  @override
  List<Object?> get props => [id];
 }
