import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class KlayBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 1.5, horizontal: kDefaultPadding * 2),
        decoration: BoxDecoration(
            color: kWalletBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "클레이 KLAY",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
  }
}
