import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/data/models/artist_model.dart';

class ArtistWiget extends StatelessWidget {
   ArtistWiget({super.key,required this.arists});
  List<ArtistModel> arists;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          ArtistModel artist=arists[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(width: 50,height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white38,
                      shape: BoxShape.circle
                  ),),
                const SizedBox(width: 10,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.6,
                        child: Text(artist.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                    const Text("Artist",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],)
              ],
            ),
          );

        }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: arists.length);
  }
}
