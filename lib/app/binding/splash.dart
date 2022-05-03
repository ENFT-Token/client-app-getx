import 'package:get/get.dart';

import 'package:enft/app/controller/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
