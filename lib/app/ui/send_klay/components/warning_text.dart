import 'package:enft/app/constant/constant.dart';
import 'package:flutter/material.dart';

class WarningText extends StatelessWidget {
  WarningText({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: kWarningBackgroundColor,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_rounded,
                        size: 16, color: kWarningTextColor),
                    RichText(
                      text: TextSpan(
                          text: title,
                          style: TextStyle(color: kWarningTextColor)),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  text,
                  style: TextStyle(color: kWarningTextColor),
                ),
              ],
            )));
  }
}
