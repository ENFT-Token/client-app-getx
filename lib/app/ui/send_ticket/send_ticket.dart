import 'package:enft/app/controller/klip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:enft/app/ui/send_ticket/components/body.dart';

class SendTicketPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: SendTicketBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        TextButton(
            // 이 부분에 sendTicket 함수 작성
            onPressed: () async => await KlipController.to.sendTicket(),
            child: Text(
              "완료",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }
}
