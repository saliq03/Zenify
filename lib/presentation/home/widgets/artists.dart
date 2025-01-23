import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/data/models/artist_model.dart';
import 'package:spotify/presentation/artist_profile/pages/artist_profile.dart';



import '../../../core/configs/constants/status.dart';

import '../bloc/home_bloc.dart';

class ArtistsWidget extends StatelessWidget {
  const ArtistsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        if(state.artistStatus==Status.loading){
          return  SizedBox(
            height: 245,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index){

                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white38),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      )
                  );
                },
                itemCount: 3),
          );
        }
        else if(state.artistStatus==Status.sucess){
          return
            SizedBox(
              height: 245,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    var artist=state.artists[index];
                    return songWidget(context,artist );
                  },
                  itemCount: state.artists.length),
            );
        }else{
          return const Center(child: Text("Something went wrong",style: TextStyle(color: Colors.white),));
        }

      },
    );
  }

  Widget songWidget(BuildContext context,ArtistModel artist){
    return  GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>ArtistProfilePage(artistId: artist.id,)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(artist.image))),

              ),
            ),
            const SizedBox(height: 10,),
            Text(artist.name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),

          ],
        ),
      ),
    );

  }
}
