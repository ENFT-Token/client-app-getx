import 'package:get/get.dart';

import 'package:enft/app/controller/post_list.dart';

import 'package:enft/app/data/provider/post_api.dart';
import 'package:enft/app/data/repository/post.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(
        PostListController(repository: PostRepository(apiClient: PostApiClient())),
        permanent: true);
    await PostListController.to.getPost();
  }
}
