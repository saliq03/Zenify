
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/choose_mode/widgets/choose_theme.dart';
import 'package:spotify/presentation/signup_or_signin/pages/signup_or_signin_page.dart';

import '../../../common/widgets/buttons/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';



class ChooseModePage extends StatelessWidget{
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBg))
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
                  const Text("Choose Mode",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color:Colors.white),),
                  const SizedBox(height: 51),
                   const ChooseThemeWidget(),
                  const SizedBox(height: 68),
                  BasicAppButton(title: "Continue", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupOrSigninPage()));
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
