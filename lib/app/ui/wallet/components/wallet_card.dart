import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';

import 'package:enft/app/ui/wallet/components/klay_box.dart';
import 'package:enft/app/ui/wallet/components/balance_box.dart';
import 'package:enft/app/ui/wallet/components/button_box.dart';

class WalletCard extends GetView<KlipController> {
  final double klaytnBalance;
  final double klaytnPrice;

  const WalletCard({
    required this.klaytnBalance,
    required this.klaytnPrice,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final KRWBalance =
        controller.currencyFormat((klaytnBalance * klaytnPrice).floor());

    return Stack(children: [
      Container(
          height: 316,
          width: size.width,
          constraints: BoxConstraints(minHeight: 316),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(22)))),
      Positioned(
          left: -37.5,
          top: -37.5,
          child: SvgPicture.asset('assets/logos/klaytn-klay-logo.svg',
              width: 250, height: 250, color: Colors.indigo)),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KlayBox(),
              const SizedBox(
                height: kDefaultPadding * 2,
              ),
              BalanceBox(),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                      horizontal: kDefaultPadding * 2),
                  child: Divider(
                    color: kSubItemColor,
                  )),
              ButtonBox()
            ],
          ))
    ]);
  }
}
