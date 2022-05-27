import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';

class TransactionKlayListItem extends GetView<KlipController> {
  TransactionKlayListItem({required this.index});

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
                controller.klipTransactionList[index].way == "withdraw"
                    ? 'assets/icons/withdraw.svg'
                    : 'assets/icons/deposit.svg',
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
                      "클레이 전송",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "클레이 수신",
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
          if (controller.klipTransactionList[index].transferType != "nft")
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${controller.klipTransactionList[index].amount.toString()} 개",
                  style: TextStyle(
                      color: controller.klipTransactionList[index].way ==
                              "withdraw"
                          ? Color(0xffE82F2F)
                          : Color(0xff50A1EA),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(controller.klipTransactionList[index].status == 1
                    ? "성공"
                    : "실패")
              ],
            )
        ]));
  }
}
