import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/search/bloc/search_bloc.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({super.key});
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        children: [
          Expanded (
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: context.isDarkMode? Color(0xff282828):Colors.transparent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xff282828))
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary)
                  )
              ),
              onChanged: (value){
                context.read<SearchBloc>().add(OnSearchChange(searchText: value));
              },
            ),
          ),
          const SizedBox(width: 20,),
          GestureDetector(onTap: (){
           controller.clear();
           context.read<SearchBloc>().add(OnSearchChange(searchText: ""));
          },
              child: const Text("Cancel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),))
        ],

      ),
    );
  }
}
