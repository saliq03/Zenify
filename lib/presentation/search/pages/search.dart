import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widgets/buttons/favourite.dart';
import 'package:spotify/presentation/search/bloc/search_bloc.dart';
import 'package:spotify/presentation/search/widgets/artist.dart';
import 'package:spotify/presentation/search/widgets/search.dart';
import 'package:spotify/presentation/search/widgets/songs.dart';

import '../../../core/configs/constants/status.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(OnSearchChange(searchText: ''));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SearchWidget(),
            Expanded(child:
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if(state.status==Status.loading){
                  return CircularProgressIndicator();
                }
                else if(state.status==Status.error){
                  return Text(" Something went wrong");
                }
                else{
                  return ListView(
                    children: [
                      ArtistWiget(arists: state.artists,),
                      const SizedBox(height: 20,),
                      SongsWidget(songs: state.songs,)
                    ],
                  );
                }

              },
            ))
          ],
        ),
      ),
    );
  }
}
