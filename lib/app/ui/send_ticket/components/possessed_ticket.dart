import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class PossessedTicket extends StatelessWidget {
  PossessedTicket(
      {required this.place,
      required this.startDate,
      required this.endDate,
      required this.during});

  final String place;
  final String startDate;
  final String endDate;
  final String during;

  @override
  Widget build(BuildContext context) {
    int index = place.indexOf("헬스장");
    final gymName =
        place.substring(0, index) + "\n" + place.substring(index, place.length);
    return Padding(
        padding: const EdgeInsets.only(top: kDefaultPadding),
        child: Row(
          children: [
            Text(place),
            SizedBox(width: kDefaultPadding,),
            Text(startDate),
            SizedBox(width: kDefaultPadding,),
            Text(endDate),
            SizedBox(width: kDefaultPadding,),
            Text(during)
          ],
        ));
  }
}
