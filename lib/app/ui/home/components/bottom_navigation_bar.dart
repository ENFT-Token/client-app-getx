import 'package:enft/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/home.dart';

class HomeBottomNavigationBar extends GetView<HomeController> {
  HomeBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kHomeBottomTabColor,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: controller.currentIndex,
        onTap: (index) => controller.currentIndex = index,
        items: controller.items));
  }
}
