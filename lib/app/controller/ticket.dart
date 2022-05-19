import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/constant/constant.dart';

class TicketController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  // Background gradient animation
  late Rx<AnimationController> _backgroundGradientController;
  late Rx<Animation<Color?>> _backgroundGradientAnimationForward;
  late Rx<Animation<Color?>> _backgroundGradientAnimationReverse;

  // Page controller
  late Rx<PageController> _pageController;
  RxInt _selectedIndex = 0.obs;
  RxDouble _currPageValue = (0.0).obs;

  // Page animation
  RxDouble _currOpacity = 1.0.obs;
  Rx<Matrix4> _matrix = Matrix4.identity().obs;
  int index = 0;
  double height = 0.0;

  TicketController();

  get backgroundGradientController => _backgroundGradientController.value;

  // set backgroundGradientController(value) => _backgroundGradientController.value = value;

  get backgroundGradientAnimationForward =>
      _backgroundGradientAnimationForward.value;

  get backgroundGradientAnimationReverse =>
      _backgroundGradientAnimationReverse.value;

  get pageController => _pageController.value;

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(value) => _selectedIndex.value = value;

  get currPageValue => _currPageValue.value;

  set currPageValue(value) => _currPageValue.value = value;

  get matrix => _matrix.value;

  set matrix(value) => _matrix.value = value;

  get currOpacity => _currOpacity.value;

  set currOpacity(value) => _currOpacity.value = value;

  @override
  void onInit() {
    initBackgroundAnimation();
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
    _backgroundGradientController.close();
    _pageController.close();
    super.onClose();
  }

  initBackgroundAnimation() {
    // Background gradient animation
    _backgroundGradientController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
            .obs;
    _backgroundGradientAnimationForward =
        ColorTween(begin: kPrimaryColor, end: kPrimaryLightColor)
            .animate(backgroundGradientController)
            .obs;
    _backgroundGradientAnimationReverse =
        ColorTween(begin: kPrimaryLightColor, end: kPrimaryColor)
            .animate(backgroundGradientController)
            .obs;

    backgroundGradientController.repeat(max: 1.0);
    backgroundGradientController.forward();

    backgroundGradientController.addListener(() {
      if (backgroundGradientController.status == AnimationStatus.completed) {
        backgroundGradientController.reverse();
        _backgroundGradientController.refresh();
      } else if (backgroundGradientController.status ==
          AnimationStatus.dismissed) {
        backgroundGradientController.forward();
        _backgroundGradientController.refresh();
      }
    });
  }

  initPageController() {
    _pageController =
        PageController(initialPage: selectedIndex, viewportFraction: 0.8).obs;
    pageController.addListener(() {
      currPageValue = pageController.page;
      _pageController.refresh();
    });
  }
}
