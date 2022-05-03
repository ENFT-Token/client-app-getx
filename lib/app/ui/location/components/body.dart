import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/location.dart';
import 'package:enft/app/controller/register.dart';

import 'package:enft/app/ui/loading_hud/loading_hud.dart';
import 'package:enft/app/ui/location/components/location_list.dart';
import 'package:enft/app/ui/location/components/rounded_rectangle_button.dart';

class LocationBody extends GetView<LocationController> {
  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
            title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
            title: Text(title), content: Text(content), actions: actions));
  }

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
              Expanded(child: LocationList(
                onPressed: () {
                  openDialog("회원가입", "계속해서 진행하시겠습니까?", [
                    TextButton(
                      child: const Text('취소'),
                      onPressed: () => Get.back(),
                    ),
                    TextButton(
                        child: const Text('확인'),
                        onPressed: () async {
                          RegisterController.to.user.location =
                              controller.location;
                          RegisterController.to.user.profile = "";
                          if (await RegisterController.to.register() == true) {
                            UserController.to.user = RegisterController.to.user;
                            final isLogin = await UserController.to
                                .login(UserController.to.user.klip);
                            if (isLogin)
                              Get.offAllNamed('/home');
                            else {
                              openDialog("에러", "다시 시도해주세요.", [
                                TextButton(
                                  child: const Text('취소'),
                                  onPressed: () => Get.back(),
                                )
                              ]);
                            }
                          } else {
                            openDialog("에러", "다시 시도해주세요.", [
                              TextButton(
                                child: const Text('취소'),
                                onPressed: () => Get.back(),
                              )
                            ]);
                          }
                        })
                  ]);
                },
              ))
            ]));
  }
}
