import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/profile/pages/profile.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
   int currentIndex=0;
   final PageController _pageController = PageController();
  List<Widget> pages=[HomePage(),ProfilePage()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },
      )

     ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: context.isDarkMode? const Color(0xff343434):const Color(0xffFFFFFF),
        onTap: (index){
          setState(() {
            currentIndex=index;
          });

          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,);

        },


          showSelectedLabels: true,
          iconSize: 30,
          selectedItemColor: Colors.green,
          unselectedItemColor: context.isDarkMode?const Color(0xff737373):const Color(0xff808080),
          items: [
            BottomNavigationBarItem(
                icon: Icon(currentIndex==0?Icons.pentagon_rounded:Icons.pentagon_outlined),
            label: ''),
            BottomNavigationBarItem(icon: Icon(currentIndex==1?Icons.person:CupertinoIcons.person),
                label: '')
          ],
      ),
    );
  }
}
