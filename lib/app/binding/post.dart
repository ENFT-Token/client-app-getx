import 'package:get/get.dart';

import 'package:enft/app/controller/post.dart';

import 'package:enft/app/data/provider/post_api.dart';
import 'package:enft/app/data/repository/post.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        PostController(repository: PostRepository(apiClient: PostApiClient())),
        permanent: true);
  }
}
