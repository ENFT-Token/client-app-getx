import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';

import 'package:enft/app/ui/send_klay/components/text_field_with_title.dart';
import 'package:enft/app/ui/send_klay/components/warning_text.dart';
import 'package:enft/app/ui/send_klay/components/text_field_container.dart';

class SendKlayBody extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TextFieldWithTitle(
                title: Text(
                  "개수",
                  style: TextStyle(
                    color: kSystemGray,
                    fontSize: 16,
                  ),
                ),
                child: Row(children: [
                  Expanded(
                      child: TextFieldContainer(
                          child: TextField(
                    controller: controller.sendAmountController,
                    inputFormatters: [
                      // 음수가 아닌 소수만 입력 가능
                      // 앞이 0인 정수 불가
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')),
                    ],
                    onChanged: (value) {
                      controller.sendAmount = double.parse(value);
                    },
                    onSubmitted: (value) =>
                        controller.sendAmount = double.parse(value),
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: "클레이 개수를 입력해주세요",
                        border: InputBorder.none),
                  ))),
                  TextButton(
                      onPressed: () {
                        controller.sendAmount =
                            UserController.to.user.klip.balance;
                        controller.sendAmountController.text = UserController
                            .to.user.klip.balance
                            .toStringAsFixed(2);
                      },
                      child: Text(
                        "MAX",
                        style: TextStyle(
                          color: kWarningTextColor,
                          fontSize: 16,
                        ),
                      ))
                ])),
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
                        Expanded(
                            child: Obx(() => Text(
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
        )));
  }
}
