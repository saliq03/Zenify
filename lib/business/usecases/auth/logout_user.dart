import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/auth/auth.dart';
import 'package:spotify/business/usecases/usecase.dart';

import '../../../service_locator.dart';

class LogoutUserUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
   return await sL<AuthRepository>().logoutUser();
  }

}