import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/login_user_request.dart';

import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';
import '../usecase.dart';

class SigninWithEmailPasswordUseCase implements UseCase<Either,LoginUserRequest>{
  @override
  Future<Either> call({LoginUserRequest? params}) async {
    return await sL<AuthRepository>().SigninWithEmailPassword(params!);
  }


}