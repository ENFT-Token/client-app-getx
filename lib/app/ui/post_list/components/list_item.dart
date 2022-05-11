import 'package:flutter/material.dart';

import 'package:enft/app/ui/post_list/components/description.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.position,
    required this.readDuration,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String position;
  final String readDuration;
  final String price;
  final Function() onTap;

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
                    child: thumbnail,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                      child: Description(
                        title: title,
                        position: position,
                        readDuration: readDuration,
                        price: price,
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
