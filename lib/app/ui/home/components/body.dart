import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/home.dart';
import 'package:enft/app/ui/ticket/ticket.dart';

class HomeBody extends GetView<HomeController> {
  List<Widget> pages = [
    const TicketPage(),
    Container(),
    Container(),
    Container(),
    Container(),
    // WalletPage(),
    // const PostListScreen(),
    // ChatPage(),
    // MyInfoPage(user: userList[0])
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => IndexedStack(index: controller.currentIndex, children: pages));
  }
}
