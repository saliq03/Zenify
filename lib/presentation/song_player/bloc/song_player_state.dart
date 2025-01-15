part of 'song_player_bloc.dart';

 class SongPlayerState extends Equatable{
   final Status status;
   final Duration duration, position;

  const SongPlayerState({
      this.status=Status.loading,
      this.duration=Duration.zero,
      this.position=Duration.zero});

   SongPlayerState copyWith({Status? status, Duration? duration, Duration? position}){
     return SongPlayerState(
      status: status?? this.status,
       duration: duration?? this.duration,
       position: position?? this.position
     );
   }

  @override
  List<Object?> get props => [status, duration, position];

 }

