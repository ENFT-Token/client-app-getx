import 'package:enft/app/ui/gym_explore/gym_explore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/home.dart';
import 'package:enft/app/ui/ticket/ticket.dart';
import 'package:enft/app/ui/wallet/wallet.dart';
import 'package:enft/app/ui/post_list/post_list.dart';
import 'package:enft/app/ui/chat/chat.dart';

class HomeBody extends GetView {
  List<Widget> pages = [
    const TicketPage(),
    WalletPage(),
    PostListPage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => IndexedStack(index: HomeController.to.currentIndex, children: pages));
  }
}
