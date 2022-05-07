import 'package:get/get.dart';

import 'package:enft/app/controller/chat.dart';
import 'package:enft/app/data/provider/chat_api.dart';
import 'package:enft/app/data/repository/chat.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() =>
        ChatController(repository: ChatRepository(apiClient: ChatApiClient())));
  }
}
