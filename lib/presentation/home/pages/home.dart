import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/status.dart';
import 'package:spotify/main.dart';
import 'package:spotify/presentation/home/bloc/home_bloc.dart';

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
    context.read<HomeBloc>().add(FetchNewsSongs());
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
          ),
            BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {

              if(state.status==Status.loading){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state.status==Status.sucess){
                return
                  SizedBox(
                    height: 245,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        var song=state.songs[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: NetworkImage(song.image))
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(song.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            Text(song.artist,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                          ],
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(width: 14,);
                      },
                      itemCount: state.songs.length),
                );
              }else{
                return const Center(child: Text("Something went wrong",style: TextStyle(color: Colors.white),));
              }

  },
)
          ],
        ),
      )
    );
  }
}
