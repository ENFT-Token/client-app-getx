import 'package:enft/app/data/provider/request_ticket_api.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/request_ticket.dart';
import '../../../controller/gym_explore.dart';

import 'package:enft/app/data/repository/request_ticket.dart';

import '../../request_ticket/request_ticket.dart';

class Description extends GetView<GymExploreController> {
  const Description({
    Key? key,
    required this.title,
    required this.klayInfo,
    required this.location,
  }) : super(key: key);

  final String location;
  final String title;
  final List<KlayData> klayInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              location,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black45,
              ),
            ),
          ],
        )),
        ElevatedButton(
          onPressed: () => controller.ToRequestTicketPage(title, klayInfo),
          style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              shape: RoundedRectangleBorder(
                // shape : 버튼의 모양을 디자인 하는 기능
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 0.0),
          child: Text("티켓 발급하러 가기"),
        ),
      ],
    );
  }
}
