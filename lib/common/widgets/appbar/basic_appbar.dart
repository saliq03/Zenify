import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget{
  const BasicAppbar({super.key,this.title});
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title?? const Text(""),
      centerTitle: true,
      leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: context.isDarkMode? Colors.white.withOpacity(0.03):
                const Color(0xffDDDDDD),
                shape: BoxShape.circle
            ),
            child:Center(
              child: Icon(Icons.arrow_back_ios_new,
              size: 15,
              color: context.isDarkMode?Colors.white:Colors.black,),
            ) ,
          ),)
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  

}

