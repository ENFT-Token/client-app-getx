import 'package:flutter/material.dart';

import 'package:enft/app/ui/wallet/components/body.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0.5,
      title: Row(children: [Text("지갑")]),
    );
  }
}
