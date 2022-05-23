import 'package:enft/app/controller/gym_explore.dart';
import 'package:get/get.dart';

class GymExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GymExploreController>(() => GymExploreController());
  }
}
