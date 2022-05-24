import 'package:enft/app/controller/gym_explore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:enft/app/ui/gym_explore/components/body.dart';

class GymExplorePage extends GetView<GymExploreController>{
  const GymExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: controller.init(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.hasData) {
        return Scaffold(body: GymExploreBody());
      } else if (snapshot.hasError) {
        return Center(child: Text("Error"));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
