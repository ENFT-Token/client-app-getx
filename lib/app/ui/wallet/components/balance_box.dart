import 'package:enft/app/controller/klip.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

class BalanceBox extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          UserController.to.user.klip.balance.toStringAsFixed(2),
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ),
        Text("≈ ${KlipController.to.klaytnPrice} KRW",
            style: TextStyle(fontSize: 24, color: Colors.white))
      ],
    );
  }
}
