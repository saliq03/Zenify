import 'package:get_it/get_it.dart';
import 'package:spotify/business/repository/auth/auth.dart';
import 'package:spotify/business/usecases/auth/signup_with_EmailPassword.dart';
import 'package:spotify/data/repository/auth/auth.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';

import 'business/usecases/auth/signin_with_email.dart';

final sL=GetIt.instance;

Future<void> initializeDependencies()async{

  sL.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sL.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );

  sL.registerSingleton<SignupWithEmailPasswordUseCase>(
      SignupWithEmailPasswordUseCase()
  );

  sL.registerSingleton<SigninWithEmailPasswordUseCase>(
      SigninWithEmailPasswordUseCase()
  );
}