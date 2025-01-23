import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: const BasicAppbar(title: Text("Search",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),hideBack: true,),
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: [
                 Expanded (
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("Cancel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
                ],
                
              ),
            ),
            Expanded(child: ListView(
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
                          SizedBox(width: MediaQuery.of(context).size.width*0.6,
                              child: Text("FKA twigs",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                          const Text("Artist",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                        ],)
                      ],
                    ),
                  );

                }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: 5),
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
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.6,
                                  child: Text("Les",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),maxLines: 1, // Limit to a single line
                                      overflow: TextOverflow.ellipsis),
                                ),
                                const Text("Song",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                              ],)
                          ],
                        ),
                      );
                    }, separatorBuilder: (context,index)=>const SizedBox(height: 20,), itemCount: 10),

              ],
            ))
          ],
        ),
    );
  }
}
