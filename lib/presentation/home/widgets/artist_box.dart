import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/widgets/appbar/basic_appbar.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';

class ArtistBoxWidgetHome extends StatelessWidget {
  const ArtistBoxWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 180,
      child: Stack(
        children: [
          Align(
            alignment:Alignment.bottomCenter,
            child: SvgPicture.asset(
                AppVectors.homeTopBox
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Image.asset(
                  AppImages.homeArtistBg
              ),
            ) ,
          )

        ],
      ),
    );
  }
}
