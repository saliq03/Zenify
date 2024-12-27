import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/signup_or_signin/pages/signup_or_signin_page.dart';

import '../../../common/widgets/buttons/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';


class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                              child: Container(
                                height:73,
                                width: 73,
                                decoration: BoxDecoration(
                                  color: const Color(0xff30393c).withOpacity(0.5),
                                  shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(AppVectors.moon,fit: BoxFit.none,),
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          const Text("Dark Mode",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500, color: Color(0xffDADADA)),)
                        ],
                      ),
                      const SizedBox(width: 71,),
                      Column(
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                              child: Container(
                                height:73,
                                width: 73,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393c).withOpacity(0.5),
                                    shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(AppVectors.sun,fit: BoxFit.none,),
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          const Text("Light Mode",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500, color: Color(0xffDADADA)),)
                        ],
                      ),
                    ],
                  ),
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
