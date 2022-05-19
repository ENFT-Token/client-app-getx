import 'package:flutter/material.dart';

import 'package:enft/app/ui/getting_started/components/body.dart';

class GettingStartedPage extends StatelessWidget {
  GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GettingStartedBody(),
    );
  }
}