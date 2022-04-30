import 'package:flutter/material.dart';

import 'package:enft/app/ui/home/components/body.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: HomeBody(),
      );
  }
}