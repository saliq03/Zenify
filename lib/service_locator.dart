import 'package:get_it/get_it.dart';
import 'package:spotify/business/repository/auth/auth.dart';
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/business/usecases/auth/get_current_user.dart';
import 'package:spotify/business/usecases/auth/logout_user.dart';
import 'package:spotify/business/usecases/auth/signup_with_EmailPassword.dart';
import 'package:spotify/business/usecases/song/add_or_remove_favourite.dart';
import 'package:spotify/business/usecases/song/fetch_artists.dart';
import 'package:spotify/business/usecases/song/get_artist.dart';
import 'package:spotify/business/usecases/song/get_favourite_songs.dart';
import 'package:spotify/business/usecases/song/get_news_songs.dart';
import 'package:spotify/business/usecases/song/get_playlist.dart';
import 'package:spotify/business/usecases/song/is_favourite.dart';
import 'package:spotify/business/usecases/song/search.dart';

import 'package:spotify/business/usecases/user_preferences/clear_user.dart';
import 'package:spotify/business/usecases/user_preferences/is_login.dart';
import 'package:spotify/common/helpers/user_prefrences.dart';
import 'package:spotify/data/repository/auth/auth.dart';
import 'package:spotify/data/repository/song/song.dart';
import 'package:spotify/data/sources/artist/artist_firebase_service.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/songs/songs_firebase_service.dart';

import 'business/usecases/auth/signin_with_email.dart';
import 'business/usecases/user_preferences/set_login_key.dart';

final sL=GetIt.instance;

Future<void> initializeDependencies()async{

  sL.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl());

  sL.registerSingleton<AuthRepository>(
      AuthRepositoryImpl());

  sL.registerSingleton<SignupWithEmailPasswordUseCase>(
      SignupWithEmailPasswordUseCase());

  sL.registerSingleton<SigninWithEmailPasswordUseCase>(
      SigninWithEmailPasswordUseCase());

  sL.registerSingleton<SongsFirebaseService>(
      SongsFirebaseServiceImpl());

  sL.registerSingleton<SongRepository>(
      SongRepositoryImpl());

  sL.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase());
  sL.registerSingleton<GetPlaylistUseCase>(
      GetPlaylistUseCase());
  sL.registerSingleton<AddOrRemoveFavouriteUseCase>(
    AddOrRemoveFavouriteUseCase());
  sL.registerSingleton<IsFavouriteUseCase>(
    IsFavouriteUseCase());
  sL.registerSingleton<UserPreferences>(
    UserPreferences());
  sL.registerSingleton<SetLoginKeyUseCase>(SetLoginKeyUseCase());
  sL.registerSingleton<IsLoginUseCase>(IsLoginUseCase());
  sL.registerSingleton<ClearUserUseCase>(ClearUserUseCase());
  sL.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase());
  sL.registerSingleton<GetFavouritesSongsUseCase>(GetFavouritesSongsUseCase());

  sL.registerSingleton<ArtistFirebaseService>(ArtistFirebaseServiceImpl());
  sL.registerSingleton<FetchArtistsUseCase>(FetchArtistsUseCase());
  sL.registerSingleton<GetArtistUseCase>(GetArtistUseCase());
  sL.registerSingleton<SearchUseCase>(SearchUseCase());
  sL.registerSingleton<LogoutUserUseCase>(LogoutUserUseCase());
}