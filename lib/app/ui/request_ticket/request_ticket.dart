import 'package:flutter/material.dart';

import 'package:enft/app/ui/request_ticket/components/body.dart';

class RequestTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: buildAppBar(), body: RequestTicketBody()));
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        TextButton(
          // 이 부분에 발급 요청 함수 작성
            onPressed: () {},
            child: Text(
              "완료",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }
}
