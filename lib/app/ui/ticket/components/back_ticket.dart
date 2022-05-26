import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:enft/app/ui/ticket/components/qr_code.dart';

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

    return Ticket(
        index: index,
        detail: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
          child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(children: [
                    Text("ENFT",
                        style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0)),
                    Text(
                      "WORK OUT",
                      style: TextStyle(color: Colors.white),
                    )
                  ])),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        border: Border.all(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("남은 기간", style: TextStyle(color: Colors.white)),
                        Text(during,
                            style: TextStyle(
                                color: Colors.lightGreenAccent,
                                fontSize: 48,
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
                  ),
                  Padding(
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      child: Row(
                        children: [
                          Column(children: [
                            QrCode(data: qrData),
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
    //   Ticket(
    //       index: index,
    //       detail: Container(
    //           margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
    //           child:
    //               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //             Expanded(
    //               child: Text("ENFT",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 40.0,
    //                       fontWeight: FontWeight.bold,
    //                       letterSpacing: 4.0)),
    //             ),
    //             // Row(
    //             //   children: [
    //             //     Expanded(
    //             //         child: buildColumnTextItem(
    //             //             "등록날짜", startDate.replaceAll('-', '.'), false)),
    //             //     buildColumnTextItem(
    //             //         "만료날짜", endDate.replaceAll('-', '.'), false),
    //             //   ],
    //             // ),
    //             // SizedBox(
    //             //   height: kDefaultPadding * 2,
    //             // ),
    //             // buildColumnTextItem("남은기간", during, true),
    //             Row(
    //               children: [
    //                 Column(children: [
    //                   QrCode(data: qrData),
    //                   const SizedBox(
    //                     height: kDefaultPadding / 2,
    //                   ),
    //                   Text(
    //                     "전자출입 QR코드",
    //                     style: TextStyle(color: Colors.white, fontSize: 12),
    //                   )
    //                 ])
    //               ],
    //             ),
    //           ])));
    // }
    //
    // Widget buildColumnTextItem(String title, String text, bool isBool) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(
    //         title,
    //         style: TextStyle(color: Colors.white, fontSize: 16.0),
    //       ),
    //       const SizedBox(
    //         height: kDefaultPadding / 4,
    //         width: 0,
    //       ),
    //       Text(
    //         text,
    //         style: TextStyle(
    //             fontWeight: isBool ? FontWeight.bold : FontWeight.normal,
    //             fontSize: isBool ? 30.0 : 16.0,
    //             color: Colors.white),
    //       )
    //     ],
    //   );
    // }
  }
}
