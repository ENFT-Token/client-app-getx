import 'package:get/get.dart';

import 'package:enft/app/controller/image.dart';
import 'package:enft/app/data/provider/image_api.dart';
import 'package:enft/app/data/repository/image.dart';

class ImageBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<ImageController>(() => ImageController(
        repository: ImageRepository(apiClient: ImageApiClient())));
    await ImageController.to.initImg();
  }
}
