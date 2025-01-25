import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/business/usecases/song/search.dart';
import 'package:spotify/core/configs/constants/status.dart';
import 'package:spotify/data/models/artist_model.dart';
import 'package:spotify/service_locator.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
   SearchBloc(): super(const SearchState()){
    on<OnSearchChange>(_onSearchChange);
   }

   void _onSearchChange(OnSearchChange event, Emitter<SearchState> emit) async{
      var result=await sL<SearchUseCase>().call(params: event.searchText);
      result.fold(
          (l){
            emit(state.copyWith(status: Status.error));
          },
          (r){
            emit(state.copyWith(status: Status.sucess,songs: r['songs'],artists: r['artists']));
          });
   }
}
