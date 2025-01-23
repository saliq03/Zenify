import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/shimmer/shimmer.dart';

import 'package:spotify/presentation/artist_profile/bloc/artist_profile_bloc.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../common/widgets/buttons/favourite.dart';
import '../../../core/configs/constants/status.dart';
import '../../song_player/pages/song_player.dart';

class ArtistSongsWidget extends StatelessWidget {
  const ArtistSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
  builder: (context, state) {
      if(state.status==Status.loading){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 30,),
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {

                  return ShimmerWidget(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              height: 42, width: 42,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white38
                              ),

                            ),
                            const SizedBox(width: 10,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 8,width:200,color: Colors.white38,),
                                const SizedBox(height: 5,),
                                Container(height: 5,width: 100,color: Colors.white38,),
                              ],
                            ),
                          ],),

                        ],
                      ) );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 20,),
                itemCount: 4)
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
            const Text("Songs",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            const SizedBox(height: 20,),
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  SongEntity track=state.artist!.allsongs[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>SongPlayerPage(songEntity: track,)));
                        },
                        child: Row(children: [
                          Container(
                            height: 42, width: 42,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.isDarkMode
                                    ? AppColors.darkGrey
                                    : const Color(0xffE6E6E6)
                            ),
                            child: Icon(Icons.play_arrow_rounded,
                              color: context.isDarkMode ? const Color(
                                  0xff959595) : const Color(0xff616161),),
                          ),
                          const SizedBox(width: 10,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(track.title, style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text(state.artist!.name, style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ],),
                      ),

                      Row(children: [
                        Text(track.duration.toString().replaceAll('.', ':'),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),),
                        const SizedBox(width: 50,),
                        FavouriteButton(songEntity: track)
                      ],)
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 20,),
                itemCount: state.artist!.allsongs.length)
          ],
        );
      }
  },
),
    );
  }
}
