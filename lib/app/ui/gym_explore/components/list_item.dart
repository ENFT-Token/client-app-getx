import 'package:enft/app/controller/gym_explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../constant/constant.dart';
import 'description.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.location,
    required this.gymInfo,
    required this.klayInfo,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String location;
  final List<KlayData> klayInfo;
  final GymData gymInfo;

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
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${dotenv.env['SERVER_ADDRESS']! + ":3000"}${thumbnail}'),
                                  fit: BoxFit.cover)))),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                      child: Description(
                          title: title,
                          location: location,
                          klayInfo: klayInfo,
                          gymInfo: gymInfo),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
