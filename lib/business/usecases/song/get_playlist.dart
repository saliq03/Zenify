import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/business/usecases/usecase.dart';
import 'package:spotify/service_locator.dart';

class GetPlaylistUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sL<SongRepository>().getPlaylist();
  }

}