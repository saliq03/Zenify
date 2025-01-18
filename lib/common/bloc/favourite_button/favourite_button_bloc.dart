import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/business/usecases/song/add_or_remove_favourite.dart';
import 'package:spotify/business/usecases/song/is_favourite.dart';
import 'package:spotify/service_locator.dart';


part 'favourite_button_event.dart';
part 'favourite_button_state.dart';

class FavouriteButtonBloc extends Bloc<FavouriteButtonEvent, FavouriteButtonState> {

  FavouriteButtonBloc():super(const FavouriteButtonState()){
   on<AddOrRemoveFavourite>(_addOrRemoveFavourite);
  }

  void initialize(String id) async {
    bool isFav=await sL<IsFavouriteUseCase>().call(params: id);
    emit(state.copyWith(isFavourite: isFav));
  }

  void _addOrRemoveFavourite(AddOrRemoveFavourite event, Emitter<FavouriteButtonState> emit)async{
    var result= await sL<AddOrRemoveFavouriteUseCase>().call(params: event.id);
    result.fold((l){},
        (r){
         emit(state.copyWith(isFavourite: r));
        }
      );
  }

}
