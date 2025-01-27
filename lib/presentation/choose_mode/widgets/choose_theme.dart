import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../bloc/theme_bloc.dart';

class ChooseThemeWidget extends StatelessWidget {
  const ChooseThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
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
                            color: context.isDarkMode? const Color(0xff30393c).withOpacity(0.5):AppColors.primary.withOpacity(0.5),
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
    );
  }
}
