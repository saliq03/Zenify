import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/auth/auth.dart';
import 'package:spotify/business/usecases/usecase.dart';
import 'package:spotify/service_locator.dart';

class GetCurrentUserUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sL<AuthRepository>().getCurrentUser();
  }

}