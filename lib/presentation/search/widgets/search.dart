import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        children: [
          Expanded (
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff282828),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  )
              ),
            ),
          ),
          const SizedBox(width: 20,),
          const Text("Cancel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
        ],

      ),
    );
  }
}
