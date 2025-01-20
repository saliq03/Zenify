import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/artist_profile/pages/widgets/artists_details.dart';

class ArtistProfilePage extends StatelessWidget {
  const ArtistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ArtistsDetailsWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 5),
            child: Text("Albums",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 15,),
          Container(

            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
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
                            color: Colors.white
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10,top: 15),
                          child: Text("Happier than ever",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,
                          color: context.isDarkMode?const Color(0xffD1D1D1): Color(0xff3A3A3A)),),
                        )
                      ],
                    ),
                  );
                },
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
