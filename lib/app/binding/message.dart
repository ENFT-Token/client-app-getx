import 'package:get/get.dart';

import 'package:enft/app/controller/message.dart';
import 'package:enft/app/data/provider/message_socket.dart';
import 'package:enft/app/data/provider/message_api.dart';
import 'package:enft/app/data/repository/message.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController(
        repository: MessageRepository(
            socketClient: MessageSocketClient(),
            apiClient: MessageApiClient())));
  }
}
