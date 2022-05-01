import 'package:get/get.dart';

import 'package:enft/app/controller/getting_started.dart';
import 'package:enft/app/controller/splash.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
