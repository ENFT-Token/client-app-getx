import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';

import 'package:enft/app/ui/wallet/components/wallet_card.dart';
import 'package:enft/app/ui/wallet/components/transaction_title_box.dart';
import 'package:enft/app/ui/wallet/components/transaction_list_view.dart';

class Body extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(
              top: kDefaultPadding * 3,
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            child: Column(
              children: [
                Obx(() => WalletCard(
                      klaytnBalance: UserController.to.user.klip.balance,
                      klaytnPrice: controller.klaytnPrice,
                    )),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                TransactionTitleBox(),
                // TODO: 이 사이 공백이 왜 생기는지 모르겠지만, 없애야함
                Expanded(child: TransactionListView())
              ],
            )));
  }
}
