import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/business/entities/user.dart';
import 'package:spotify/business/usecases/auth/get_current_user.dart';
import 'package:spotify/business/usecases/auth/logout_user.dart';
import 'package:spotify/business/usecases/song/get_favourite_songs.dart';
import 'package:spotify/service_locator.dart';


import '../../../business/usecases/user_preferences/clear_user.dart';
import '../../../core/configs/constants/status.dart';
import '../../signup_or_signin/pages/signin_page.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(): super(const ProfileState()){
    on<GetUser>(_getUser);
    on<FetchFavouriteSongs>(_fetchFavouriteSongs);
    on<RemoveFavouriteSong>(_removeFavouriteSong);
    on<LogoutUser>(_logoutUser);
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
  void _removeFavouriteSong(RemoveFavouriteSong event, Emitter<ProfileState> emit){
    List<SongEntity> updatedFavourites = List.from(state.favourites);
    updatedFavourites.removeAt(event.index);

    emit(state.copyWith(favourites:updatedFavourites));
  }
  void _logoutUser(LogoutUser event,Emitter<ProfileState> emit) async{
    var result=await sL<LogoutUserUseCase>().call();
    result.fold((l){
      ScaffoldMessenger.of(event.context).
       showSnackBar(const SnackBar(content: Text("Something went wrong"),backgroundColor: Colors.red,));
    }, (r){
      Navigator.pushAndRemoveUntil(event.context,
          MaterialPageRoute(builder: (_)=>SignInPage()),
              (Route<dynamic> route) => false);
      sL<ClearUserUseCase>().call();
    });
  }
}



