import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode_page.dart';

import '../../../core/configs/theme/app_colors.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBg))
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment:Alignment.topCenter,
                      child: SvgPicture.asset(AppVectors.logo)),
                  const Spacer(),
                  const Text("Enjoy Listening To Music",
                    style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25) ,),
                  const SizedBox(height: 21,),
                  const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." ,
                      style:TextStyle(color: AppColors.grey,fontSize: 17,fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 21,),
                  BasicAppButton(title: "Get Started", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChooseModePage()));
                  })


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
