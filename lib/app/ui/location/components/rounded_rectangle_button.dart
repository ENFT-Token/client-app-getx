import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class RoundedRectangleButton extends StatelessWidget {
  RoundedRectangleButton({required this.onPressed, required this.text});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(kPrimaryLightColor),
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
      ),
    );
  }
}
