import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:enft/app/ui/ticket/components/qr_code.dart';

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

    return Ticket(
        index: index,
        detail: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(children: [
                    Text("ENFT",
                        style: TextStyle(
                          color: kTicketMainTextColor,
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "WORK OUT",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ])),
                  Row(
                    children: [
                      Column(children: [
                        QrCode(data: qrData),
                        const SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        Text(
                          "전자출입 QR코드",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ])
                    ],
                  ),
                ],
              )),
        ));
  }
}
