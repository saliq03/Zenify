import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/creat_user_request.dart';
import 'package:spotify/data/models/login_user_request.dart';

abstract class AuthRepository{
  Future<Either> SigninWithEmailPassword(LoginUserRequest loginUserReq);
  Future<Either> SignupWithEmailPassword(CreateUserRequest createUserReq);
  Future<Either> getCurrentUser();

}