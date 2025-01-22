import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/shimmer/shimmer.dart';
import 'package:spotify/presentation/artist_profile/bloc/artist_profile_bloc.dart';

import '../../../core/configs/constants/status.dart';

class ArtistsDetailsWidget extends StatelessWidget {
  const ArtistsDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
  builder: (context, state) {
    if(state.status==Status.loading){
      return ShimmerWidget(
          child:Column(
            children: [
              Container(
                height: 260,width: double.infinity,
                decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(69),
                        bottomLeft: Radius.circular(69)
                    ),
                    color: Colors.white38
                ),

              ),
              const SizedBox(height: 12,),
              Container(width: 100,height: 10,color: Colors.white38,),
              const SizedBox(height: 5,),
              Container(width: 200,height: 5,color: Colors.white38,), const SizedBox(height: 10,),
             const SizedBox(height: 10,),
              Container(width: 230,height: 3,color: Colors.white38,),
              const SizedBox(height: 5,),
              Container(width: 300,height: 3,color: Colors.white38,),
              const SizedBox(height: 5,),
              Container(width: 130,height: 3,color: Colors.white38,),
            ],
          )
      );
    }
    else if(state.status==Status.error){
      return const Text("Something went wrong");
    }
    else{
      return Column(
        children: [
          Container(
            height: 260,width: double.infinity,
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(69),
                    bottomLeft: Radius.circular(69)
                ),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage(state.artist!.image) )
            ),

          ),
          const SizedBox(height: 12,),
          Text(state.artist!.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          Text("${state.artist!.albums.length} Album, ${state.artist!.tracks.length} Track",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,
              color: context.isDarkMode?const Color(0xffD3D3D3): const Color(0xff393939)),),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.65,
            child: Text(state.artist!.bio,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,
                  color: context.isDarkMode?const Color(0xffA7A7A7): const Color(0xff838383)),
              textAlign: TextAlign.center,),
          ),
        ],
      );
    }

  },
);
  }
}
