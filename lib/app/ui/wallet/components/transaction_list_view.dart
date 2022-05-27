import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';

import 'package:enft/app/ui/wallet/components/transaction_klay_list_item.dart';
import 'package:enft/app/ui/wallet/components/transaction_nft_list_item.dart';

class TransactionListView extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.klipTransactionList.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child:
                  controller.klipTransactionList[index].transferType == "klay"
                      ? TransactionKlayListItem(index: index)
                      : TransactionNFTListItem(index: index));
        }));
  }
}
