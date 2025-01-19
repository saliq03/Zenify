import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/business/entities/user.dart';
import 'package:spotify/business/usecases/auth/get_current_user.dart';
import 'package:spotify/business/usecases/song/get_favourite_songs.dart';
import 'package:spotify/service_locator.dart';


import '../../../core/configs/constants/status.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(): super(const ProfileState()){
    on<GetUser>(_getUser);
    on<FetchFavouriteSongs>(_fetchFavouriteSongs);
  }

  void _getUser(GetUser event, Emitter<ProfileState> emit)async{
    var result=await sL<GetCurrentUserUseCase>().call();
    result.fold(
            (l){
          emit(state.copyWith(status: Status.error));
        },(r){
              UserEntity user=r;
              emit(state.copyWith(status: Status.sucess,name: user.name,email: user.email,image: user.imageUrl));
    });
  }

  void _fetchFavouriteSongs (FetchFavouriteSongs event,Emitter<ProfileState> emit)async{
    var result =await sL<GetFavouritesSongsUseCase>().call();
    result.fold((l){
      emit(state.copyWith(favouritesStatus: Status.error));
    }, (r){
      emit(state.copyWith(favouritesStatus: Status.sucess,favourites: r));
    });
  }
}


