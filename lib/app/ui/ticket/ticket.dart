import 'package:flutter/material.dart';

import 'package:enft/app/ui/ticket/components/body.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: TicketBody()));
  }
}
