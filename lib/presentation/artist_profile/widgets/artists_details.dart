import 'package:flutter/cupertino.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class ArtistsDetailsWidget extends StatelessWidget {
  const ArtistsDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 260,width: double.infinity,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(69),
                  bottomLeft: Radius.circular(69)
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:NetworkImage('https://hips.hearstapps.com/hmg-prod/images/gettyimages-1175559425.jpg') )
          ),

        ),
        const SizedBox(height: 12,),
        Text("Billi Eilesh",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),
        Text("2 Album, 67 Track",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,
            color: context.isDarkMode?const Color(0xffD3D3D3): Color(0xff393939)),),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.65,
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae",
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,
                color: context.isDarkMode?const Color(0xffA7A7A7): Color(0xff838383)),
            textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
