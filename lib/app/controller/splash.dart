import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find<SplashController>();
  RxBool isExpanded = false.obs;
  RxBool isOpacity = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    animation();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  animation() {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => toggle(isExpanded))
        .then((value) => Future.delayed(const Duration(seconds: 1)))
        .then((value) => toggle(isOpacity))
        .then((value) => Future.delayed(const Duration(seconds: 5)))
        .then((value) {
      Get.offNamed('/home');
    });
  }

  void toggle(var value) => value.value = !value.value;
}
