import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/auth/auth.dart';
import 'package:spotify/business/usecases/usecase.dart';
import 'package:spotify/data/models/creat_user_request.dart';
import 'package:spotify/service_locator.dart';

class SignupWithEmailPasswordUseCase implements UseCase<Either,CreateUserRequest>{
  @override
  Future<Either> call({CreateUserRequest? params}) async {
   return await sL<AuthRepository>().SignupWithEmailPassword(params!);
  }


}