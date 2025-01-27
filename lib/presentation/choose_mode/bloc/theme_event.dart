part of 'theme_bloc.dart';

 class ThemeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
class LoadTheme extends ThemeEvent{}
class SetDarkTheme extends ThemeEvent{}
class SetLightTheme extends ThemeEvent{}
