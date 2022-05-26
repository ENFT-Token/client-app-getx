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
                      klaytnBalance: UserController.to.user.klip.balance,
                      klaytnPrice: controller.klaytnPrice,
                    )),
                // TODO: 코인 기록 리스트 뷰 만들기
              ],
            )));
  }
}
