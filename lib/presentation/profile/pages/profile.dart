import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/profile/bloc/profile_bloc.dart';

import '../../../core/configs/constants/status.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 late ProfileBloc _bloc;
  @override
  void initState() {
    _bloc=ProfileBloc();
    _bloc.add(GetUser());
    super.initState();
  }
  
  @override
  void dispose() {
   _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
    create: (_)=>_bloc,

   child:  Scaffold(
     appBar: const BasicAppbar(title: Text("Profile",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),color: AppColors.darkGrey,),
    body: Column(
      children: [
      Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(69),
            bottomRight: Radius.circular(69)
          )
        ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
  builder: (context, state) {
    if(state.status==Status.loading){
      return CircularProgressIndicator();
    }
    else if(state.status==Status.error){
      return Text("Something went wrong!");
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
          Text(state.email,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xffD8D4D4)),),
          const SizedBox(height: 5,),
          Text(state.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        ],
      );
    }


  },
),),
      ],
    ),
    ));
  }
}
