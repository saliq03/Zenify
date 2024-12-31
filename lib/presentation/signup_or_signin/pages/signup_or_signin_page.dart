import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/signup_or_signin/pages/signin_page.dart';
import 'package:spotify/presentation/signup_or_signin/pages/signup_page.dart';



class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
           Align(alignment: Alignment.topRight,
               child: SvgPicture.asset(AppVectors.topPattern)),
          Align(alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppVectors.bottomPattern)),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBg),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 55,),
                  const Text("Enjoy Listening To Music",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 21,),
                  Text("Spotify is a proprietary Swedish audio streaming and media services provider",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: context.isDarkMode?const Color(0xffA0A0A0) :const Color(0xff797979)),textAlign: TextAlign.center,),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        flex:1,
                          child: BasicAppButton(title: "Register", onPress: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                          }, height: 70,)),
                      const SizedBox(width: 30,),TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                      }, child: Text("Sign in",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: context.isDarkMode? Colors.white:Colors.black),))
                    ],
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
