import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/business/usecases/song/get_artist.dart';

import 'package:spotify/core/configs/constants/status.dart';
import 'package:spotify/data/models/artist_model.dart';
import 'package:spotify/service_locator.dart';

part 'artist_profile_event.dart';
part 'artist_profile_state.dart';

class ArtistProfileBloc extends Bloc<ArtistProfileEvent, ArtistProfileState> {
  ArtistProfileBloc(): super (ArtistProfileState()){
  on<FetchArtist>(_fetchArtist );
  }
  void _fetchArtist (FetchArtist event, Emitter<ArtistProfileState> emit) async{
    var result =await sL<GetArtistUseCase>().call(params: event.id);
    result.fold((l){
      emit(state.copyWith(status: Status.error));
    }, (r){
      emit(state.copyWith(status: Status.sucess,artist: r));
    });
  }

}
