import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/ui/wallet/components/icon_button_box.dart';

class ButtonBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButtonBox(
            onTap: () {
              KlipController.to.initCheckList();
              Get.toNamed('/wallet/send_ticket');
            },
            description: "NFT 전송"),

        // TODO: 코인 입금 페이지 만들기
        IconButtonBox(onTap: () => {}, description: "코인 입금"),
        IconButtonBox(
            onTap: () => Get.toNamed('/wallet/send_klay'), description: "코인 출금")
      ],
    );
  }
}
