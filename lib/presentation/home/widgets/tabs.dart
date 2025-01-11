import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/theme/app_colors.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({required this.tabController,super.key});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
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
    );
  }
}
