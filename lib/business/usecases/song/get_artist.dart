import 'package:dartz/dartz.dart';
import 'package:spotify/business/repository/song/song.dart';
import 'package:spotify/business/usecases/usecase.dart';
import 'package:spotify/service_locator.dart';

class GetArtistUseCase implements UseCase<Either,String>{
  @override
  Future<Either> call({String? params}) async{
   return await sL<SongRepository>().getArtist(params!);
  }
}