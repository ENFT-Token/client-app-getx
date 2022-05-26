import 'package:flutter/material.dart';

import 'package:enft/app/ui/ticket/components/body.dart';

import '../../constant/constant.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200], body: TicketBody());
  }
}
