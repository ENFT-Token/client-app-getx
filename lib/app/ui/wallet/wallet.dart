import 'package:flutter/material.dart';

import 'package:enft/app/ui/wallet/components/body.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Body()));
  }
}
