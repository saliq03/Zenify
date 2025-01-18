part of 'favourite_button_bloc.dart';

 class  FavouriteButtonState extends Equatable {
   final bool isFavourite;

  const FavouriteButtonState({ this.isFavourite=false});
  FavouriteButtonState copyWith({bool? isFavourite}){
    return FavouriteButtonState(
        isFavourite: isFavourite?? this.isFavourite);
  }

  @override
  List<Object?> get props => [isFavourite];

 }
