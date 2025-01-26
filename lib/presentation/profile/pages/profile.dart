import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/profile/bloc/profile_bloc.dart';
import 'package:spotify/presentation/profile/widget/favourite_songs.dart';
import 'package:spotify/presentation/profile/widget/user_details.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  void initState() {

    context.read<ProfileBloc>().add(GetUser());
    context.read<ProfileBloc>().add(FetchFavouriteSongs());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: const Text("Profile",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        hideBack: true,
        action: popUpMenuWidget(),
        color: context.isDarkMode ? AppColors.darkGrey : Colors.white,),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            UserDetailsWidget(),
           SizedBox(height: 20),
            FavouriteSongsWiddget()
          ],
        ),
      ),
    );
  }

  Widget popUpMenuWidget(){
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert_rounded),
        onSelected: (value){
          if(value=='logout'){
            context.read<ProfileBloc>().add(LogoutUser(context: context));
          }
        },
        itemBuilder:  (context)=>[
          const PopupMenuItem(
            value: 'logout',
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
            ),
          ),]
    );
  }
}
