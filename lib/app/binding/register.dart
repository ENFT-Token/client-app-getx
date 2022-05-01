import 'package:get/get.dart';

import 'package:enft/app/controller/register.dart';
import 'package:enft/app/data/provider/register_api.dart';
import 'package:enft/app/data/repository/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(
        repository: RegisterRepository(apiClient: RegisterApiClient())));
  }
}
