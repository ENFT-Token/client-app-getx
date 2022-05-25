import 'package:enft/app/controller/gym_explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'description.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.location,
    required this.klayInfo,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String location;
  final List<KlayData> klayInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          const Divider(
            height: 0,
            thickness: 0.2,
            indent: 0,
            endIndent: 0,
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Card(
                        elevation: 0,
                        child: Image.network(
                            '${dotenv.env['SERVER_ADDRESS']!}${thumbnail}',
                            fit: BoxFit.contain)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                      child: Description(
                          title: title, location: location, klayInfo: klayInfo),
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
