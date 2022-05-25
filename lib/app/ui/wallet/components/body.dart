import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/wallet/components/wallet_card.dart';

class Body extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => WalletCard(
                    klaytnBalance:
                    UserController.to.user.klip.balance,
                    klaytnPrice: controller.klaytnPrice,
                    receiveKlay: () {},
                    sendKlay: () {})),
                OutlinedButton(
                    onPressed: () => Get.toNamed('/wallet/send_klay'),
                    child: Text("클레이튼 송금")),
                OutlinedButton(
                    onPressed: () {
                      controller.initCheckList();
                      Get.toNamed('/wallet/send_ticket');
                    },
                    child: Text("티켓 전송")),
                // OutlinedButton(
                //     onPressed: () =>
                //         Get.toNamed('/post/gym_name/request_ticket'),
                //     child: Text("발급 요청")),
              ],
            )));
  }
}
