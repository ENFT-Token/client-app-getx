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
        children: [
          WelcomeBox(),
          // TODO: 페이지뷰에서 이전 화면과 다음 화면이 안 보임
          Expanded(child: TicketPageView()),
          NotificationBox()
        ]);
  }
}
