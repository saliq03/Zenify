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
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0)
                ),
              ),
            ),
            Expanded(child: Container(
              color: Colors.red,
             child: ListView(
               children: [
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),
                 Container(height: 20,width: double.infinity,color: Colors.white38,),
                 SizedBox(height: 20,),

               ],
             ),
            ))
          ],
        ),
    );
  }
}
