import 'package:enft/app/ui/gym_explore/components/body.dart';
import 'package:flutter/material.dart';

class GymExplorePage extends StatelessWidget {
  const GymExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: GymExploreBody()));
  }
}
