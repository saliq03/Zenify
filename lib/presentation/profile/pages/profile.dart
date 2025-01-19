import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/profile/bloc/profile_bloc.dart';
import 'package:spotify/presentation/profile/widget/favourite_songs.dart';
import 'package:spotify/presentation/profile/widget/user_details.dart';

import '../../../common/widgets/buttons/favourite.dart';
import '../../../core/configs/constants/status.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc _bloc;

  @override
  void initState() {
    _bloc = ProfileBloc();
    _bloc.add(GetUser());
    _bloc.add(FetchFavouriteSongs());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bloc,

        child: Scaffold(
          appBar: BasicAppbar(title: const Text("Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            color: context.isDarkMode ? AppColors.darkGrey : Colors.white,),
          body: SingleChildScrollView(
            child: const Column(
              children: [
                UserDetailsWidget(),
               SizedBox(height: 20),
                FavouriteSongsWiddget()
              ],
            ),
          ),
        ));
  }
}
