
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../widgets/artist_albums.dart';
import '../widgets/artist_songs.dart';
import '../widgets/artists_details.dart';

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
