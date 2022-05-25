import 'package:flutter/material.dart';

import 'package:enft/app/ui/ticket/components/body.dart';

import '../../constant/constant.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), backgroundColor: Colors.grey[50], body: TicketBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0.5,
      title: Row(children: [
        Text(
          "이용권",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
