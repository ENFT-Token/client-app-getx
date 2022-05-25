import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:enft/app/ui/ticket/components/bottom_ticket.dart';

class FrontTicket extends StatelessWidget {
  const FrontTicket(
      {Key? key,
      required this.index,
      required this.place,
      required this.qrData})
      : super(key: key);

  final int index;
  final String place;
  final String qrData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    int placeIndex = place.indexOf("헬스장");
    final name = placeIndex == -1
        ? place
        : place.substring(0, placeIndex) +
            "\n" +
            place.substring(placeIndex, place.length);

    return Ticket(
        index: index,
        detail: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.topRight,
                child: Text("ENFT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4.0)),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name + " 이용권",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
              BottomTicket(data: qrData),
            ],
          ),
        ));
  }
}
