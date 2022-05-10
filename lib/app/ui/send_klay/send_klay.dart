import 'package:enft/app/controller/klip.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/klip.dart';

import 'package:enft/app/ui/send_klay/components/body.dart';

class SendKlayPage extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(),
      body: SendKlayBody(),
    ));
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        TextButton(
            // 이 부분에 발급 요청 함수 작성
            onPressed: () async => await controller.sendKlay(),
            child: Text(
              "완료",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }
}
