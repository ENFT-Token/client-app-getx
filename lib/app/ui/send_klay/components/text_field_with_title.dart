import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/ui/send_klay/components/text_field_container.dart';

class TextFieldWithTitle extends StatelessWidget {
  TextFieldWithTitle({required this.title, required this.child});

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              TextFieldContainer(child: child),
            ]));
  }
}
