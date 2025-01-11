import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spotify/presentation/home/bloc/home_bloc.dart';

import 'package:spotify/presentation/home/widgets/artist_box.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';
import 'package:spotify/presentation/home/widgets/playlist_widget.dart';
import 'package:spotify/presentation/home/widgets/tabs.dart';

import '../../../common/widgets/appbar/basic_appbar.dart';
import '../../../core/configs/assets/app_vectors.dart';


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
    context.read<HomeBloc>().add(FetchNewsSongs());
    context.read<HomeBloc>().add(GetPlaylist());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BasicAppbar(title: SvgPicture.asset(AppVectors.logo,height: 40,),hideback: true,),

      body:SingleChildScrollView(
       child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ArtistBoxWidgetHome(),
           TabsWidget(tabController: tabController),
           SizedBox(
            height: 250,
            child: TabBarView(
              controller: tabController,
                children: [
                 const NewsSongsWiget(),
                  Container(),
                  Container(),
                  Container(),
            
                ]),
          ),
           PlaylistWidget()




          ],
        ),
      )
    );
  }
}
