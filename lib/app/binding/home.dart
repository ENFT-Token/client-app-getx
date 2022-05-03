import 'package:get/get.dart';

import 'package:enft/app/controller/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
