
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/business/usecases/user_preferences/is_login.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/bottom_nav/pages/bottom_nav.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/intro/pages/get_started_page.dart';
import 'package:spotify/service_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppVectors.logo)),
    );
  }

  void redirect() async{

    bool isLogin=await sL<IsLoginUseCase>().call();
    Future.delayed(const Duration(seconds: 3),(){
      if(isLogin){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavPage()));
      }
      else{

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const GetStartedPage()));
      }
      });
  }
}
