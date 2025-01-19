
import 'package:dartz/dartz.dart';

import '../../../business/repository/auth/auth.dart';
import '../../../service_locator.dart';
import '../../models/creat_user_request.dart';
import '../../models/login_user_request.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> SigninWithEmailPassword(LoginUserRequest loginUserReq) async {
   return await sL<AuthFirebaseService>().SigninWithEmailPassword(loginUserReq);
  }

  @override
  Future<Either> SignupWithEmailPassword(CreateUserRequest createUserReq) async {
    return sL<AuthFirebaseService>().SignupWithEmailPassword(createUserReq);

  }

  @override
  Future<Either> getCurrentUser() async{
    return await sL<AuthFirebaseService>().getCurrentUser();
  }


}