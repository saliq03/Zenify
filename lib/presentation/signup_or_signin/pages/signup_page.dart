import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/business/usecases/auth/signup_with_EmailPassword.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/creat_user_request.dart';
import 'package:spotify/presentation/signup_or_signin/pages/signin_page.dart';
import 'package:spotify/service_locator.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});

   final nameController=TextEditingController();
   final emailController=TextEditingController();
   final passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: BasicAppbar(
       title:SvgPicture.asset(AppVectors.logo,height: 35,) ,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const Text("Register",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,),),
                  const SizedBox(height: 50,),
                  TextFormField(
                    controller: nameController,
                   decoration: const InputDecoration(
                     hintText: "Full Name"
                   ).applyDefaults(
                     Theme.of(context).inputDecorationTheme
                   ),
                  ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Enter Email"
                  ).applyDefaults(
                      Theme.of(context).inputDecorationTheme
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: "Enter Password"
                  ).applyDefaults(
                      Theme.of(context).inputDecorationTheme
                  ),
                ),
                const SizedBox(height: 33,),
                BasicAppButton(title: "Create Account", onPress: () async {
                  var result= await sL<SignupWithEmailPasswordUseCase>().call(
                    params: CreateUserRequest(name: nameController.text.toString(),
                        email: emailController.text.toString(),
                        password: passwordController.text.toString())
                  );
                  result.fold(
                      (l){
                        ScaffoldMessenger.of(context).
                        showSnackBar(SnackBar(content: Text(l),
                            backgroundColor: Colors.redAccent,));
                      },
                          (r){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(content: Text(r),
                                backgroundColor: Colors.green,));

                      });
                }),
                const SizedBox(height: 29,),
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey,height: 1,)),
                    Text("  Or  ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                    Expanded(child: Divider(color: Colors.grey,height: 1,)),

                  ],
                ),
                const SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SvgPicture.asset(AppVectors.google),
                  const SizedBox(width: 60,),
                  SvgPicture.asset(AppVectors.apple,colorFilter: ColorFilter.mode(
                  context.isDarkMode?Colors.white:Colors.black, BlendMode.srcIn),),

                ],),
                const SizedBox(height: 31,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do You Have An Account?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignInPage()));
                    }, child: const Text("Sign In",style:TextStyle(fontSize: 15,color: Color(0xff288CE9),fontWeight: FontWeight.w500),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
