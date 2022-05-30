import 'package:flutter/material.dart';

import 'package:enft/app/ui/deposit_klay/components/body.dart';

class DepositKlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: DepositKlayBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "클레이 입금",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
