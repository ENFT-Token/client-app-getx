import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';
import 'package:enft/app/ui/send_ticket/components/possessed_ticket.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import '../../register/components/text_field_container.dart';

class SendTicketBody extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldContainer(
            child: TextField(
          onChanged: (value) => KlipController.to.sendToAddress = value,
          onSubmitted: (value) => KlipController.to.sendToAddress = value,
          decoration: InputDecoration(
              counterText: '',
              hintText: "상대방 지갑 주소를 입력해주세요",
              border: InputBorder.none),
        )),
        Text("보유하고 있는 티켓 목록"),
        Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(() => ListView.builder(
                    itemCount: UserController.to.user.klip.nfts.length,
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PossessedTicket(
                                place: UserController.to.user.klip.nfts[index]
                                    ['place'],
                                startDate: UserController
                                    .to.user.klip.nfts[index]['start_date'],
                                endDate: UserController.to.user.klip.nfts[index]
                                    ['end_date'],
                                during: UserController.to.user.klip.nfts[index]
                                    ['during']),
                            Obx(() => Checkbox(
                                value:
                                    KlipController.to.isCheckList[index].value,
                                onChanged: (value) {
                                  if (value == true) {
                                    KlipController.to.isCheckList[index].value =
                                        value;
                                    if (KlipController.to.isTrueList
                                            .contains(index) !=
                                        true) {
                                      KlipController.to.isTrueList.add(index);
                                    }
                                  } else {
                                    KlipController.to.isCheckList[index].value =
                                        value;
                                    if (KlipController.to.isTrueList
                                            .contains(index) ==
                                        true) {
                                      KlipController.to.isTrueList
                                          .remove(index);
                                    }
                                  }
                                })),
                          ]);
                    })))),
      ],
    );
  }
}
