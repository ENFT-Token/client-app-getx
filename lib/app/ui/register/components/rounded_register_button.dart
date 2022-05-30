import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/register.dart';

class RoundedRegisterButton extends GetView<RegisterController> {
  const RoundedRegisterButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.textColor = Colors.white})
      : super(key: key);

  final String text;
  final Function() onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // total height = margin 20 + padding 20 + text 24
    return Obx(() => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40)),
                    backgroundColor: !controller.isAlreadyNickname
                        ? MaterialStateProperty.all(kDisableColor)
                        : MaterialStateProperty.all(kPrimaryColor),
                    foregroundColor: !controller.isAlreadyNickname
                        ? MaterialStateProperty.all(kDisableTextColor)
                        : MaterialStateProperty.all(kPrimaryColor)),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )))));
  }
}
