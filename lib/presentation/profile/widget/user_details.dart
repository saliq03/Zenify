
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/constants/status.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../bloc/profile_bloc.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color:  context.isDarkMode? AppColors.darkGrey:const Color(0xffFFFFFF),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(69),
              bottomRight: Radius.circular(69)
          )
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state.status==Status.loading){
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white38,

                    ),),
                  const SizedBox(height: 20,),
                  Container(height: 7,width: 200,color: Colors.white38),
                  const SizedBox(height: 5,),
                  Container(height: 10,width: 100,color: Colors.white38)
                ],
              ),
            );
          }
          else if(state.status==Status.error){
            return const Center(child: Text("Something went wrong!"));
          }
          else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(state.image) )
                  ),),
                const SizedBox(height: 20,),
                Text(state.email,style:  TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: context.isDarkMode? const Color(0xffD8D4D4): const Color(0xff222222)),),
                const SizedBox(height: 5,),
                Text(state.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              ],
            );
          }


        },
      ),);
  }
}
