import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // total height = margin 20 + padding 10 + hint 20?
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kSubItemColor, borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}
