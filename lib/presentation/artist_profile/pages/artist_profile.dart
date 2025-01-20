import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/artist_profile/pages/widgets/artist_albums.dart';
import 'package:spotify/presentation/artist_profile/pages/widgets/artist_songs.dart';
import 'package:spotify/presentation/artist_profile/pages/widgets/artists_details.dart';

import '../../../core/configs/theme/app_colors.dart';

class ArtistProfilePage extends StatelessWidget {
  const ArtistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
