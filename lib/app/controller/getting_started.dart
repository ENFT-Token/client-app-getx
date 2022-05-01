import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:enft/app/ui/getting_started/components/slide_item.dart';

class GettingStartedController extends GetxController {
  var page = 0.obs;
  var controller = PageController().obs;

  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (page.value < slideList.length - 1) {
        page.value++;
      } else {
        page.value = 0;
      }
      animateTo(page.value);
    });
    super.onInit;
  }

  @override
  void onClose() {
    controller.close();
    super.onClose();
  }

  onPageChanged(input) {
    page.value = input;
  }

  animateTo(int page) {
    if (controller.value.hasClients) {
      controller.value.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
}
