import 'package:flutter/material.dart';

import 'package:enft/app/ui/home/components/body.dart';
import 'package:enft/app/ui/home/components/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: HomeBody(),
      bottomNavigationBar: HomeBottomNavigationBar(),
    ));
  }
}
