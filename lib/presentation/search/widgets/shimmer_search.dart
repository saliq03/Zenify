import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/shimmer/shimmer.dart';

class ShimmerSearchWidget extends StatelessWidget {
  const ShimmerSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
        child: ListView(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){

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
                            Container(width: MediaQuery.of(context).size.width*0.6,height: 10,
                              color: Colors.white38,),
                            const SizedBox(height: 5,),
                            Container(width: 100,height: 5,color: Colors.white38,)
                          ],)
                      ],
                    ),
                  );

                }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: 3),
            const SizedBox(height: 20,),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(width: 50,height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                          ),),
                        const SizedBox(width: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Container(width: MediaQuery.of(context).size.width*0.6,height: 10,color: Colors.white38,),
                            const SizedBox(height: 5,),
                            Container(width: 100,height: 5,color: Colors.white38,)
                          ],)
                      ],
                    ),
                  );
                }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: 4)
          ],
        ));
  }
}
