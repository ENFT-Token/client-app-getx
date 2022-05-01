import 'package:get/get.dart';

import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/data/provider/klaytn_api.dart';
import 'package:enft/app/data/provider/klip_api.dart';
import 'package:enft/app/data/repository/klip.dart';

class KlipBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<UserController>(() => UserController(
        repository: KlipRepository(
            klipApiClient: KlipApiClient(),
            klaytnApiClient: KlaytnApiClient())));
    await KlipApiClient().initKlipApi();
  }
}
