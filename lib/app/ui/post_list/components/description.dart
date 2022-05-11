import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.title,
    required this.position,
    required this.readDuration,
    required this.price,
  }) : super(key: key);

  final String title;
  final String position;
  final String readDuration;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: kDefaultPadding/2)),
        Text(
          position + " · " + readDuration,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black45,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: kDefaultPadding/2)),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}