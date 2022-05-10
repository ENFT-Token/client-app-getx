import 'package:enft/app/controller/klip.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/wallet/components/wallet_card.dart';

class Body extends GetView<KlipController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WalletCard(
                    klaytnBalance: controller.klip.balance,
                    klaytnPrice: controller.klaytnPrice,
                    receiveKlay: () {},
                    sendKlay: () {}),
                OutlinedButton(
                    onPressed: () =>
                        Get.toNamed('/post/gym_name/request_ticket'),
                    child: Text("발급 요청"))
              ],
            )));
  }
}
