import 'package:flutter/material.dart';

import 'package:enft/app/ui/ticket/components/welcome_box.dart';
import 'package:enft/app/ui/ticket/components/ticket_page_view.dart';
import 'package:enft/app/ui/ticket/components/notification_box.dart';

class TicketBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [WelcomeBox(), TicketPageView(), NotificationBox()]);
  }
}
