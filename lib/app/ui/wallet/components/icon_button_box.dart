import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

class IconButtonBox extends StatelessWidget {
  IconButtonBox({required this.onTap, required this.description});

  final Function() onTap;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  color: kWalletIconBoxColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              description,
              style: TextStyle(color: kWalletIconTextColor, fontSize: 12),
            )
          ],
        ));
  }
}
