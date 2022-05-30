import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/constant/constant.dart';

class TicketController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  static TicketController get to => Get.find<TicketController>();

  // Page controller
  late Rx<PageController> _pageController;
  RxInt _selectedIndex = 0.obs;
  RxDouble _currPageValue = (0.0).obs;

  // Page animation
  RxDouble _currOpacity = 1.0.obs;
  Rx<Matrix4> _matrix = Matrix4.identity().obs;
  int index = 0;
  double height = 0.0;

  // QR code Timer
  Timer? _timer;

  RxInt _qrCodeRemainTime = 30.obs;

  TicketController();

  get pageController => _pageController.value;

  refreshPageController() => _pageController.refresh();

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(value) => _selectedIndex.value = value;

  get currPageValue => _currPageValue.value;

  set currPageValue(value) => _currPageValue.value = value;

  get matrix => _matrix.value;

  set matrix(value) => _matrix.value = value;

  get currOpacity => _currOpacity.value;

  set currOpacity(value) => _currOpacity.value = value;

  get qrCodeRemainTime => _qrCodeRemainTime.value;

  set qrCodeRemainTime(value) => _qrCodeRemainTime.value = value;

  @override
  void onInit() {
    initPageController();
    super.onInit();
  }

  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }

  @override
  void onClose() {
    _pageController.close();
    super.onClose();
  }

  void setTimer() {
    int currentQrIndex = 0;
    if(!UserController.to.user.klip.nfts.isEmpty) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(UserController.to.user.klip.nfts.isEmpty) return;
        if (UserController.to.getRemainQrData(currPageValue.round()) == 0) {
          UserController.to.refreshQrData(currPageValue.round());
        }
        qrCodeRemainTime =
            UserController.to.getRemainQrData(currPageValue.round());
        if (currentQrIndex != currPageValue.round()) {
          currentQrIndex = currPageValue.round();
          UserController.to.refreshQrData(currPageValue.round());
        }
        print(qrCodeRemainTime);
      });
    }
  }


  initPageController() {
    _pageController =
        PageController(initialPage: selectedIndex, viewportFraction: 1).obs;

    setTimer();
    pageController.addListener(() {
      currPageValue = pageController.page;

      _pageController.refresh();
    });
  }
}
