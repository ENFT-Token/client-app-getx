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
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: controller.currentIndex,
        onTap: (index) => controller.currentIndex = index,
        items: controller.items));
  }
}
