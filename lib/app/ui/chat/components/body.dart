import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/binding/user.dart';
import 'package:enft/app/binding/image.dart';
import 'package:enft/app/controller/chat.dart';
import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/message.dart';

import 'package:enft/app/data/repository/message.dart';
import 'package:enft/app/data/provider/message_api.dart';
import 'package:enft/app/data/provider/message_socket.dart';

import 'package:enft/app/ui/message/message.dart';

import 'package:enft/app/ui/chat/components/chat_card.dart';

class ChatBody extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.chatList.length,
        itemBuilder: (context, index) => ChatCard(
            chat: controller.chatList[index],
            press: () {
              controller.roomId = UserController.to.user.nickname +
                  " " +
                  controller.chatList[index].name;
              Get.to(() => MessagePage(),
                  arguments: {'index': index, 'roomId': controller.roomId, 'tag': controller.roomId},
                  binding: BindingsBuilder(() {
                Get.put<MessageController>(
                    MessageController(
                        repository: MessageRepository(
                            socketClient: MessageSocketClient(),
                            apiClient: MessageApiClient())),
                    tag: controller.roomId);
                ImageBinding();
                UserBinding();
              }));
              // Get.toNamed('/message',
              //     arguments: {'index': index, 'roomId': controller.roomId});
              // Get.toNamed('/message',
              //     arguments: {'index': index, 'roomId': controller.roomId});
            })));
  }
}
