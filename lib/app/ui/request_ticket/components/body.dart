import 'dart:convert';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/user.dart';
import 'package:enft/app/ui/send_klay/components/warning_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/request_ticket.dart';
import 'package:enft/app/ui/request_ticket/components/rounded_drop_down.dart';

import '../../../controller/gym_explore.dart';
import '../../send_klay/components/text_field_container.dart';
import '../../send_klay/components/text_field_with_title.dart';

class RequestTicketBody extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<RequestTicketController>(tag: Get.arguments['tag']);
    String place = Get.arguments["tag"];

    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              place,
              style: TextStyle(fontSize: 24),
            ),
            WarningText(
                title: " 발급 요청을 하면 헬스장에 클레이가 전송됩니다.",
                text: "발급 요청을 하고 나면, 환불 받기까지 최대 일주일의 시간이 소요됩니다."),
            TextFieldWithTitle(
                title: Text(
                  "기간",
                  style: TextStyle(
                    color: kSystemGray,
                    fontSize: 16,
                  ),
                ),
                child: Obx(() => RoundedDropDown(
                        child: DropdownButton(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      items: controller.klayInfoList
                          .map<DropdownMenuItem<KlayData>>(
                              (e) => DropdownMenuItem<KlayData>(
                                    child: Text('${e.month}개월'),
                                    value: e,
                                  ))
                          .toList(),
                      value: controller.selectKlayInfo,
                      onChanged: (value) {
                        controller.selectKlayInfo = value;
                        print(controller.selectKlayInfo.month.toString());
                        print(controller.selectKlayInfo.klay.toString());
                      },
                    )))),
            TextFieldWithTitle(
              title: Text(
                "금액",
                style: TextStyle(
                  color: kSystemGray,
                  fontSize: 16,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding * 1.25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Obx(() => Text(
                                '${controller.selectKlayInfo.klay}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ))),
                      Text(
                        'KLAY',
                        style: TextStyle(
                          color: kSystemGray,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )),
            ),
            TextFieldWithTitle(
                title: Text(
                  "현재 잔고",
                  style: TextStyle(
                    color: kSystemGray,
                    fontSize: 16,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding * 1.25),
                    child: Row(
                      children: [
                        Obx(() => Expanded(
                            child: Text(
                              UserController.to.user.klip.balance
                                  .toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ))),
                        Text(
                          "KLAY",
                          style: TextStyle(
                            color: kSystemGray,
                            fontSize: 16,
                          ),
                        )
                      ],
                    )))
          ],
        ));
  }
}
