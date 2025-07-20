

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:spotify/business/entities/song.dart';
import 'package:spotify/business/usecases/song/fetch_artists.dart';
import 'package:spotify/business/usecases/song/get_news_songs.dart';
import 'package:spotify/business/usecases/song/get_playlist.dart';
import 'package:spotify/data/models/artist_model.dart';

import '../../../core/configs/constants/status.dart';
import '../../../service_locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc(): super (const HomeState()){
    on<FetchNewsSongs>(_fetchNewsSongs);
    on<GetPlaylist>(_getPlaylist);
    on<FetchArtists>(_fetchArtists);
  }
// fetch all songs
  void _fetchNewsSongs(FetchNewsSongs event, Emitter<HomeState> emit) async {
    var result= await sL<GetNewsSongsUseCase>().call();
    result.fold(
        (l){
          emit(state.copyWith(newsSongsStatus:Status.error,message: l));
        },
        (r){
          emit(state.copyWith(newsSongsStatus: Status.sucess, songs: r));
        }
    );
  }

  void _getPlaylist(GetPlaylist event, Emitter<HomeState> emit)async{
    var result= await sL<GetPlaylistUseCase>().call();
    result.fold(
            (l){
          emit(state.copyWith(playlistStatus:Status.error,message: l));
        },
            (r){
          emit(state.copyWith(playlistStatus: Status.sucess, playlist: r));
        }
    );
  }

  void _fetchArtists(FetchArtists event, Emitter<HomeState> emit) async {
    var result= await sL<FetchArtistsUseCase>().call();
    result.fold(
            (l){
          emit(state.copyWith(artistStatus: Status.sucess));
        },
            (r){
          emit(state.copyWith(artistStatus: Status.sucess, artists: r));
        }
    );
  }

}
