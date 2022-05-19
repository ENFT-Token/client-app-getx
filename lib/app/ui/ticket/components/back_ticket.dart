import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:enft/app/ui/ticket/components/bottom_ticket.dart';

class BackTicket extends StatelessWidget {
  const BackTicket(
      {Key? key,
      required this.index,
      required this.startDate,
      required this.endDate,
      required this.during,
      required this.qrData})
      : super(key: key);

  final int index;
  final String startDate;
  final String endDate;
  final String during;
  final String qrData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return Ticket(
        index: index,
        detail: Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Row(
                children: [
                  Expanded(
                      child: buildColumnTextItem(
                          "등록날짜", startDate.replaceAll('-', '.'), false)),
                  buildColumnTextItem(
                      "만료날짜", endDate.replaceAll('-', '.'), false),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              buildColumnTextItem("남은기간", during, true),
              SizedBox(
                height: kDefaultPadding * 3,
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              BottomTicket(data: qrData),
            ])));
  }

  Widget buildColumnTextItem(String title, String text, bool isBool) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        const SizedBox(
          height: kDefaultPadding / 4,
          width: 0,
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: isBool ? FontWeight.bold : FontWeight.normal,
              fontSize: isBool ? 30.0 : 16.0,
              color: Colors.white),
        )
      ],
    );
  }
}
