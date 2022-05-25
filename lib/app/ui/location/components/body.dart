import 'package:enft/app/controller/image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/location.dart';
import 'package:enft/app/controller/register.dart';
import 'package:enft/app/controller/klip.dart';

import 'package:enft/app/data/model/klip.dart';

import 'package:enft/app/ui/loading_hud/loading_hud.dart';
import 'package:enft/app/ui/location/components/location_list.dart';
import 'package:enft/app/ui/location/components/rounded_rectangle_button.dart';

class LocationBody extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RoundedRectangleButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    LoadingHud loadingHud = LoadingHud(context: context);
                    loadingHud.showHud();
                    try {
                      await controller.getAroundLocation();
                    } catch (e) {
                      print(e);
                    }
                    loadingHud.hideHud();
                  },
                  text: '현재 위치로 찾기'),
              Expanded(child: LocationList())
            ]));
  }
}
