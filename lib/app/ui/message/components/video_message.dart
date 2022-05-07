import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/data/model/message.dart';

class VideoMessage extends StatelessWidget {
  const VideoMessage({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.55),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/photos/post1.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 25,
            width: 25,
            decoration:
                BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
            child: Icon(
              Icons.play_arrow,
              size: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
