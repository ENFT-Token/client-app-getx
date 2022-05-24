import 'package:flutter/material.dart';

import 'package:enft/app/ui/request_ticket/components/body.dart';

import '../../controller/gym_explore.dart';

class RequestTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: buildAppBar(), body: RequestTicketBody()));
  }
  AppBar buildAppBar() {
    return AppBar(
      actions: [],
    );
  }
}
