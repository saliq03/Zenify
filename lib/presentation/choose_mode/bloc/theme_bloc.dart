
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spotify/business/usecases/user_preferences/is_darkmode.dart';
import 'package:spotify/business/usecases/user_preferences/set_theme.dart';
import 'package:spotify/service_locator.dart';

import '../../../core/configs/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()){
    on<LoadTheme>(_loadTheme);
    on<SetDarkTheme>(_setDarkTheme);
    on<SetLightTheme>(_setLightTheme);
  }
  void _loadTheme(LoadTheme event,Emitter<ThemeState> emit) async{
    bool isDarkMode=await sL<IsDarkModeUseCase>().call();
    if(isDarkMode){
      emit(state.copyWith(appTheme: AppTheme.darkTheme ));
    }
    else{
      emit(state.copyWith(appTheme: AppTheme.lightTheme ));
    }

  }
  void _setDarkTheme(SetDarkTheme event,Emitter<ThemeState> emit) async{
        emit(state.copyWith(appTheme: AppTheme.darkTheme));
        sL<SetThemeUseCase>().call(params: true);

  }
  void _setLightTheme(SetLightTheme event,Emitter<ThemeState> emit) async{
    emit(state.copyWith(appTheme: AppTheme.lightTheme));
    sL<SetThemeUseCase>().call(params: false);

  }

}
