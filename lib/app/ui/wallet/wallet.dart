import 'package:flutter/material.dart';

import 'package:enft/app/ui/wallet/components/body.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Body()));
  }
}
