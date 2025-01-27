part of 'theme_bloc.dart';

 class ThemeState extends Equatable {

   final ThemeData appTheme;
   ThemeState({ThemeData? appTheme}) : appTheme = appTheme ?? AppTheme.darkTheme;

   ThemeState copyWith({ThemeData? appTheme}){
     return ThemeState(
       appTheme: appTheme?? this.appTheme
     );
   }
  @override
  List<Object?> get props => [appTheme];

 }


