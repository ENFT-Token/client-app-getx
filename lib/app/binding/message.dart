import 'package:get/get.dart';

import 'package:enft/app/binding/image.dart';
import 'package:enft/app/binding/user.dart';

import 'package:enft/app/controller/message.dart';
import 'package:enft/app/data/provider/message_socket.dart';
import 'package:enft/app/data/provider/message_api.dart';
import 'package:enft/app/data/repository/message.dart';

class MessageBinding extends Bindings {
  final String tag;

  MessageBinding({required this.tag});

  @override
  void dependencies() {
    Get.put<MessageController>(MessageController(
        repository: MessageRepository(
            socketClient: MessageSocketClient(),
            apiClient: MessageApiClient())), tag: tag);
    ImageBinding();
    UserBinding();
  }
}
