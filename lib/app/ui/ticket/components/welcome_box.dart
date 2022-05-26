import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/user.dart';

class WelcomeBox extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
        child: Column(
          children: [
            Text(
              UserController.to.user.nickname + "님, 안녕하세요",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              "ESSENTIAL NFT, ENFT",
              style: TextStyle(color: kSystemGray),
            ),
          ],
        ));
  }
}
