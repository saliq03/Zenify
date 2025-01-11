import 'package:flutter/cupertino.dart';

class SongCoverWidget extends StatelessWidget {
  const SongCoverWidget({super.key,required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image))
      ),
    );
  }
}
