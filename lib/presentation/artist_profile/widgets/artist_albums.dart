import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/shimmer/shimmer.dart';
import 'package:spotify/data/models/artist_model.dart';

import 'package:spotify/presentation/artist_profile/bloc/artist_profile_bloc.dart';

import '../../../core/configs/constants/status.dart';

class ArtistAlbumsWidget extends StatelessWidget {
  const ArtistAlbumsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
      builder: (context, state) {
      if(state.status==Status.loading){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    return
                      ShimmerWidget(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 135,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white38
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 15),
                              height: 7,width: 130,color: Colors.white38,
                            ),
                          ],
                        ),
                      ));
                  },
                  itemCount: 3),
            )
          ],
        );
      }
      else if(state.status==Status.error){
        return const Text("Something went wrong");
      }
      else {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 5, bottom: 15),
                child: Text("Albums",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ),
              Container(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Albums album = state.artist!.albums[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 135,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(album.image))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 15),
                              child: Text(album.name, style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600,
                                  color: context.isDarkMode ? const Color(
                                      0xffD1D1D1) : const Color(0xff3A3A3A)),),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: state.artist!.albums.length),
              )
            ],
          );
      }
      },
    );
  }
}
