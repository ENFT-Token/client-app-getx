import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';

class TransactionNFTListItem extends GetView<KlipController> {
  TransactionNFTListItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(children: [
          Container(
              height: 55,
              width: 55,
              padding: const EdgeInsets.all(kDefaultPadding / 1.25),
              decoration: BoxDecoration(
                  color: kSubItemColor,
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: SvgPicture.asset(
                'assets/icons/NFT.svg',
                width: 55,
                height: 55,
                color: Colors.black,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.klipTransactionList[index].way == "withdraw"
                  ? Text(
                      "클레이 NFT 전송",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "클레이 NFT 수신",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
              const SizedBox(height: kDefaultPadding / 2),
              Text(
                controller.klipTransactionList[index].transactionTime
                    .toString()
                    .substring(0, 19),
                style: TextStyle(fontSize: 12),
              )
            ],
          )),
        ]));
  }
}
