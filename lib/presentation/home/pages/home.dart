import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import 'package:spotify/presentation/home/widgets/artist_box.dart';

import '../../../core/configs/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController=TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArtistBoxWidgetHome(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
            child: TabBar(
                controller: tabController,
                labelColor: context.isDarkMode?Colors.white:Colors.black,
                 indicatorWeight: 5,
                indicatorPadding: EdgeInsets.only(left: 7,right: 7),
                indicatorColor: AppColors.primary,
                isScrollable: true,
                tabs: [
                  Text("News",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                  Text("Video",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,)),
                  Text("Artists",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                  Text("Podcast",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),)
            ]),
          )
          ],
        ),
      )
    );
  }
}
