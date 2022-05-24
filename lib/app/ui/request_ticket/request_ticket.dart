import 'package:flutter/material.dart';

import 'package:enft/app/ui/request_ticket/components/body.dart';

import '../../controller/gym_explore.dart';

class RequestTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: RequestTicketBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      title: Text("이용권 발급 요청"),
      actions: [],
    );
  }
}
