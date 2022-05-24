import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';
import 'package:enft/app/ui/send_ticket/components/possessed_ticket.dart';

import 'package:enft/app/ui/send_klay/components/text_field_container.dart';
import 'package:enft/app/ui/send_klay/components/text_field_with_title.dart';
import 'package:enft/app/ui/send_klay/components/warning_text.dart';

class SendTicketBody extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WarningText(
                title: " 상대방 지갑 주소가 맞는지 확인해주세요.",
                text: "원하는 상대방이 아닌 다른 상대방에게 전송 할 경우, 되돌려 받을 수 없으며 책임질 수 없습니다."),
            TextFieldWithTitle(
              title: Text(
                "주소",
                style: TextStyle(
                  color: kSystemGray,
                  fontSize: 16,
                ),
              ),
              child: TextFieldContainer(
                  child: TextField(
                onChanged: (value) => controller.sendToAddress = value,
                onSubmitted: (value) => controller.sendToAddress = value,
                decoration: InputDecoration(
                    counterText: '',
                    hintText: "상대방 지갑 주소를 입력해주세요",
                    border: InputBorder.none),
              )),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "보유하고 있는 티켓 목록",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: kDefaultPadding / 4),
            Text("전송 할 이용권을 선택해주세요", style: TextStyle(color: kSystemGray)),
            Divider(),
            Expanded(
                child: Obx(() => ListView.separated(
                      shrinkWrap: true,
                      itemCount: UserController.to.user.klip.nfts.length,
                      itemBuilder: (context, index) {
                        return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: PossessedTicket(
                                      place: UserController
                                          .to.user.klip.nfts[index]['place'],
                                      startDate: UserController.to.user.klip
                                          .nfts[index]['start_date']
                                          .toString()
                                          .substring(2),
                                      endDate: UserController
                                          .to.user.klip.nfts[index]['end_date']
                                          .toString()
                                          .substring(2),
                                      during: UserController
                                          .to.user.klip.nfts[index]['during'])),
                              Obx(() => Checkbox(
                                  value: KlipController
                                      .to.isCheckList[index].value,
                                  onChanged: (value) {
                                    if (value == true) {
                                      KlipController
                                          .to.isCheckList[index].value = value;
                                      if (KlipController.to.isTrueList
                                              .contains(index) !=
                                          true) {
                                        KlipController.to.addToTrueList(index);
                                      }
                                    } else {
                                      KlipController
                                          .to.isCheckList[index].value = value;
                                      if (KlipController.to.isTrueList
                                              .contains(index) ==
                                          true) {
                                        KlipController.to.removeFromTrueList(index);
                                      }
                                    }
                                  })),
                            ]);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                    ))),
          ],
        ));
  }
}
