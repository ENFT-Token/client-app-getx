import 'package:enft/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:enft/app/ui/wallet/components/body.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), backgroundColor: Colors.grey[50], body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0.5,
      title: Row(children: [
        Text(
          "지갑",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
