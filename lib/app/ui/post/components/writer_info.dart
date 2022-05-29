import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:enft/app/constant/constant.dart';

class WriterInfo extends StatelessWidget {
  WriterInfo({
    required this.profile,
    required this.nickname,
    required this.location,
  });

  final File profile;
  final String nickname;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                        image: profile.path.contains('default_profile')
                            ? NetworkImage(dotenv.env['SERVER_ADDRESS']! +
                                ':3000' +
                                profile.path)
                            : NetworkImage('http://' + profile.path))),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding / 4,
                ),
                Text(
                  location,
                  style: TextStyle(color: kSystemGray, fontSize: 12),
                )
              ],
            )
          ],
        ));
  }
}
