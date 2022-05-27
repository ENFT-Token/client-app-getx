import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

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
            icon: SvgPicture.asset(
              'assets/icons/NFT.svg',
              width: 44,
              height: 44,
              color: Colors.white,
              fit: BoxFit.fill,
            ),
            description: "NFT 전송"),

        // TODO: 코인 입금 페이지 만들기
        IconButtonBox(
            onTap: () => {},
            icon: SvgPicture.asset(
              'assets/icons/deposit.svg',
              width: 44,
              height: 44,
              color: Colors.white,
              fit: BoxFit.fill,
            ),
            description: "코인 입금"),
        IconButtonBox(
            onTap: () => Get.toNamed('/wallet/send_klay'),
            icon: SvgPicture.asset(
              'assets/icons/withdraw.svg',
              width: 44,
              height: 44,
              color: Colors.white,
              fit: BoxFit.fill,
            ),
            description: "코인 출금")
      ],
    );
  }
}
