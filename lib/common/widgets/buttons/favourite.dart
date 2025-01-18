import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/business/entities/song.dart';
import 'package:spotify/common/bloc/favourite_button/favourite_button_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/theme/app_colors.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key, required this.songEntity});

  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (_) {
      final bloc = FavouriteButtonBloc();
      bloc.initialize(songEntity.id);
      return bloc;
    },
      child: BlocBuilder<FavouriteButtonBloc, FavouriteButtonState>(
        builder: (context, state) {
          return IconButton(onPressed: () {
            context.read<FavouriteButtonBloc>().add(AddOrRemoveFavourite(id: songEntity.id));

          },
              icon: Icon(
                state.isFavourite? Icons.favorite:Icons.favorite_outline_outlined,
                size: 25,
                color: context.isDarkMode? const Color(0xff565656): const Color(0xffB4B4B4),
              ) );
        },
      ),
    );
  }
}
