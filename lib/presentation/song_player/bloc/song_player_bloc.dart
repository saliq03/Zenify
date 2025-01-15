import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/business/entities/song.dart';

import '../../../core/configs/constants/status.dart';


part 'song_player_event.dart';
part 'song_player_state.dart';

class SongPlayerBloc extends Bloc<SongPlayerEvent, SongPlayerState> {
  final AudioPlayer player;
  SongPlayerBloc(this.player) : super(const SongPlayerState()) {
    on<LoadSong>(_loadSong);
    on<UpdatePosition>(_updatePosition);
    on<ChangePositon>(_changePosition);
    on<PlayOrPause>(_playOrPause);

  }


  void _loadSong(LoadSong event, Emitter<SongPlayerState> emit) async {
    try{
      final duration=await player.setUrl(event.song.song);
      player.play();
      emit(state.copyWith(status: Status.sucess,duration: duration));
    }catch(e){
      emit(state.copyWith(status: Status.error));
    }
  }
  void _updatePosition(UpdatePosition event, Emitter<SongPlayerState> emit){
    emit(state.copyWith(position: event.updatedPosition));
  }
 void _changePosition(ChangePositon event, Emitter<SongPlayerState> emit) async {
    await player.seek(event.newPosition);
    emit(state.copyWith(position: event.newPosition));

  }
 void _playOrPause(PlayOrPause event, Emitter<SongPlayerState> emit){
    if(player.playing){
      player.pause();
    }
    else{
      player.play();
    }
 }

}
