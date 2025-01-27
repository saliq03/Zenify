import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_bloc.dart';
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
                  BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                 return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          context.read<ThemeBloc>().add(SetDarkTheme());
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                child: Container(
                                  height:73,
                                  width: 73,
                                  decoration: BoxDecoration(
                                    color: context.isDarkMode? AppColors.primary.withOpacity(0.3):const Color(0xff30393c).withOpacity(0.5),
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
                      ),
                      const SizedBox(width: 71,),
                      GestureDetector(
                        onTap: (){
                          context.read<ThemeBloc>().add(SetLightTheme());
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                child: Container(
                                  height:73,
                                  width: 73,
                                  decoration: BoxDecoration(
                                      color: context.isDarkMode? Color(0xff30393c).withOpacity(0.5):AppColors.primary.withOpacity(0.5),
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
                      ),
                    ],
                  );
  },
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
