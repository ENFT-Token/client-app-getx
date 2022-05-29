import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class MainText extends StatelessWidget {
  MainText({required this.title, required this.during, required this.content});

  final String title;
  final String during;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black)),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          during,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        // Row(
        //   children: [
        //     Text(
        //       countText,
        //       style: TextStyle(color: Colors.grey.shade600),
        //     )
        //   ],
        // )
      ],
    );
  }
}
