import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:enft/app/ui/ticket/components/qr_code.dart';
import 'package:get/get.dart';

class BackTicket extends StatelessWidget {
  const BackTicket(
      {Key? key,
      required this.index,
      required this.place,
      required this.startDate,
      required this.endDate,
      required this.during,
      required this.qrData})
      : super(key: key);

  final int index;
  final String place;
  final String startDate;
  final String endDate;
  final String during;
  final String qrData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Ticket(
        index: index,
        detail: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    RichText(
                      maxLines: 1,
                      text: TextSpan(
                          text: place,
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            color: kTicketMainTextColor,
                            fontSize: size.width * 0.1,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Text(
                      "WORK OUT",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2),
                          child: Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.85),
                                border:
                                    Border.all(color: Colors.white, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("남은 기간",
                                    style: TextStyle(color: Colors.white)),
                                Text(during,
                                    style: TextStyle(
                                        color: kTicketMainTextColor,
                                        fontSize: size.width * 0.175,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("등록 날짜 ",
                                        style: TextStyle(color: Colors.white)),
                                    Text(startDate.replaceAll('-', '.'),
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("만료 날짜 ",
                                        style: TextStyle(color: Colors.white)),
                                    Text(endDate.replaceAll('-', '.'),
                                        style: TextStyle(color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
                      child: Row(
                        children: [
                          Column(children: [
                            QrCode(index: index),
                            const SizedBox(
                              height: kDefaultPadding / 2,
                            ),
                            Text(
                              "전자출입 QR코드",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ])
                        ],
                      )),
                ],
              )),
        ));
  }
}
