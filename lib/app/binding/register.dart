import 'package:get/get.dart';

import 'package:enft/app/controller/register.dart';
import 'package:enft/app/data/provider/register_api.dart';
import 'package:enft/app/data/provider/sqflite_api.dart';

import 'package:enft/app/data/repository/sqflite.dart';
import 'package:enft/app/data/repository/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<RegisterController>(() => RegisterController(
        registerRepository: RegisterRepository(apiClient: RegisterApiClient()),
        sqfliteRepository: SqfliteRepository(
            api: SqfliteApi())));
  }
}
