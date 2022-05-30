import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/ui/post_list/components/description.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.nickname,
    required this.readDuration,
    required this.cost,
    required this.onTap,
  }) : super(key: key);

  final File? thumbnail;
  final String title;
  final String nickname;
  final String readDuration;
  final String cost;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 1.0,
                      child: thumbnail != null
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://${thumbnail?.path}'),
                                      fit: BoxFit.cover)))
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.all(kDefaultPadding),
                                  child: Image.asset(
                                    'assets/photos/post_default_image.png',
                                    fit: BoxFit.contain,
                                  )))),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          20.0, kDefaultPadding / 2, 2.0, kDefaultPadding / 2),
                      child: Description(
                        title: title,
                        nickname: nickname,
                        readDuration: readDuration,
                        price: cost,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
