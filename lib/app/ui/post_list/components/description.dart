import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.title,
    required this.nickname,
    required this.readDuration,
    required this.price,
  }) : super(key: key);

  final String title;
  final String nickname;
  final String readDuration;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "by " + nickname + " on " + readDuration,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black45,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: kDefaultPadding / 2)),
        Expanded(
            child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        const Padding(padding: EdgeInsets.only(bottom: kDefaultPadding / 2)),
        Text(
          price + " KLAY",
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
