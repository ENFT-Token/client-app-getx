import 'package:get/get.dart';

import 'package:enft/app/controller/location.dart';
import 'package:enft/app/data/provider/location_api.dart';
import 'package:enft/app/data/repository/location.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController(
        repository: LocationRepository(apiClient: LocationApiClient())));
  }
}
