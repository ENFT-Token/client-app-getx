import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class NotificationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "ENFT의 새로운 소식",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(
                  Icons.notifications_none_rounded,
                  size: 32,
                )
              ],
            )));
  }
}
