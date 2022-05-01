import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/ui/register/components/rounded_input_field.dart';

class RoundedCheckDuplicateButton extends StatelessWidget {
  const RoundedCheckDuplicateButton(
      {Key? key,
      required this.maxLength,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      required this.onSubmitted,
      required this.onPressed})
      : super(key: key);

  final int maxLength;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // total height = margin 20 + padding 20 + text 24
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        RoundedInputField(
          maxLength: maxLength,
          hintText: hintText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
        Positioned(
            right: kDefaultPadding,
            child: TextButton(onPressed: onPressed, child: Text("중복체크")))
      ],
    );
  }
}
