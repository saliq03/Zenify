import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

import '../usecase.dart';

class AddOrRemoveFavouriteUseCase implements UseCase<Either,String>{
  @override
  Future<Either> call({String? params}) async{
    return await sL<SongRepository>().addOrRemoveFavourite(params!);
  }

}