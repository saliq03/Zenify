
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

import '../usecase.dart';

class IsFavouriteUseCase implements UseCase<bool,String>{
  @override
  Future<bool> call({String? params}) async{
    return await sL<SongRepository>().isFavourite(params!);
  }


}