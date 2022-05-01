import 'package:enft/app/binding/klip.dart';
import 'package:get/get.dart';

import 'package:enft/app/controller/getting_started.dart';

class GettingStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GettingStartedController>(() => GettingStartedController());
  }
}