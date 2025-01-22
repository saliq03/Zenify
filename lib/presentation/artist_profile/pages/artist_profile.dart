import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/artist_profile/bloc/artist_profile_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../widgets/artist_albums.dart';
import '../widgets/artist_songs.dart';
import '../widgets/artists_details.dart';

class ArtistProfilePage extends StatefulWidget {
  const ArtistProfilePage({super.key});

  @override
  State<ArtistProfilePage> createState() => _ArtistProfilePageState();
}

class _ArtistProfilePageState extends State<ArtistProfilePage> {
  late ArtistProfileBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ArtistProfileBloc();
    _bloc.add(FetchArtist(id: 1.toString()));
  }
 @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArtistsDetailsWidget(),
              ArtistAlbumsWidget(),
              ArtistSongsWidget()


            ],
          ),
        ),
      ),
    );
  }
}
