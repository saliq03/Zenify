import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/artist_profile/pages/artist_profile.dart';
import 'package:spotify/presentation/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/profile/pages/profile.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late BottomNavBloc _bloc;
   final PageController _pageController = PageController();
  List<Widget> pages=[const HomePage(),Container(color: Colors.red,),const ArtistProfilePage(),const ProfilePage()];

  
  @override
  void initState() {
    _bloc=BottomNavBloc();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => _bloc,
  child: BlocBuilder<BottomNavBloc, BottomNavState>(
  builder: (context, state) {
    return Scaffold(
      body:PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index){
          context.read<BottomNavBloc>().add(ChangeIndex(index: index));
        },
        children: pages,
      )

     ,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
          currentIndex: state.currentIndex,
          backgroundColor: context.isDarkMode? const Color(0xff343434):const Color(0xffFFFFFF),
          onTap: (index){
            if (index != state.currentIndex) {
              _pageController.jumpToPage(
                index,);
              context.read<BottomNavBloc>().add(ChangeIndex(index: index));

            }
          },
            showSelectedLabels: true,
            iconSize: 30,
            selectedItemColor: Colors.green,
            unselectedItemColor: context.isDarkMode?const Color(0xff737373):const Color(0xff808080),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(state.currentIndex==0?Icons.pentagon_rounded:Icons.pentagon_outlined),
              label: ''),
              BottomNavigationBarItem(icon: Icon(state.currentIndex==1?CupertinoIcons.hexagon_fill:CupertinoIcons.hexagon),
                  label: ''),
              BottomNavigationBarItem(icon: Icon(state.currentIndex==2?Icons.favorite:Icons.favorite_outline_outlined),
                  label: ''),
              BottomNavigationBarItem(icon: Icon(state.currentIndex==3?Icons.person:CupertinoIcons.person),
                  label: '')
            ],
        ),
      ),
    );
  },
),
);
  }
}
