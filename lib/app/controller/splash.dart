import 'package:enft/app/binding/klip.dart';
import 'package:enft/app/binding/user.dart';
import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find<SplashController>();
  RxBool isExpanded = false.obs;
  RxBool isOpacity = false.obs;

  @override
  void onInit() async {
    KlipBinding();
    UserBinding();
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

  animation() async {
    await KlipController.to.getAddress();// 이때 실행하면 안됨
    final isLogin = await UserController.to.login(KlipController.to.klip);
    Future.delayed(const Duration(milliseconds: 750))
        .then((value) => toggle(isExpanded))
        .then((value) => Future.delayed(const Duration(milliseconds: 1250)))
        .then((value) => toggle(isOpacity))
        .then((value) => Future.delayed(const Duration(seconds: 5)))
        .then((value) {
      if (isLogin)
        Get.offNamed('/home');
      else
        Get.offNamed('/getting_started');
    });
  }

  void toggle(var value) => value.value = !value.value;
}
