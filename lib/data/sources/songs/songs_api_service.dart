import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/data/models/music_data.dart';
abstract class  SongsApiService {
  Future<Either> searchSongs(String query);
}

class SongsApiServicesImpl extends SongsApiService{


  final String apiKey = "b147bc26d5mshef4b493f8a85a90p131be8jsne9e359d3c535";
  final String apiHost = "deezerdevs-deezer.p.rapidapi.com";

  @override
  Future<Either> searchSongs(String query) async {
    final url = Uri.https(apiHost, '/search', {'q': query});

    try{
      final response = await http.get(
        url,
        headers: {
          "X-RapidAPI-Key": apiKey,
          "X-RapidAPI-Host": apiHost,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData == null || !jsonData.containsKey('data')) {
          return left("Unexpected response structure");
        }
        List<SongEntity> songs=[];
        MusicDataModel musicDataModel=MusicDataModel.fromJson(jsonData);
        for(SngModel song in musicDataModel.data!){
          songs.add(song.toEntity(false));
        }
        return right(songs);

      } else {
        return left("An error occured");
      }
    }catch (e){
      return left("An error occurred: ${e.toString()}");
    }

  }


}