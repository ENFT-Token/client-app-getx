import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';

class WalletCard extends GetView<KlipController> {
  final double klaytnBalance;
  final double klaytnPrice;
  final Function() receiveKlay;
  final Function() sendKlay;

  const WalletCard({
    Key? key,
    required this.klaytnBalance,
    required this.klaytnPrice,
    required this.receiveKlay,
    required this.sendKlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KRWBalance = controller.currencyFormat((klaytnBalance * klaytnPrice).floor());
    return Card(
        color: kPrimaryColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    'assets/logos/klaytn-klay-logo.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  const Text(
                    "클레이(KLAY)",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ]),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  controller.klip.balance.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text("( ≈ $KRWBalance KRW)",
                    style: TextStyle(fontSize: 14, color: Colors.white38))
              ],
            )));
  }
}
