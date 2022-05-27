import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class IconButtonBox extends StatelessWidget {
  IconButtonBox(
      {required this.onTap, required this.icon, required this.description});

  final Function() onTap;
  final Widget icon;
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
                padding: const EdgeInsets.all(kDefaultPadding / 1.25),
                decoration: BoxDecoration(
                    color: kWalletIconBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: icon),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              description,
              style: TextStyle(color: kWalletIconTextColor, fontSize: 12),
            )
          ],
        ));
  }
}
