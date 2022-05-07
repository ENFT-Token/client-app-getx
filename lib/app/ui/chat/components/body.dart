import 'package:enft/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/chat.dart';
import 'package:enft/app/ui/chat/components/chat_card.dart';

class ChatBody extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.chatList.length,
        itemBuilder: (context, index) => ChatCard(
            chat: controller.chatList[index],
            press: () {
              controller.roomId = UserController.to.user.nickname +
                  " " +
                  controller.chatList[index].name;
              Get.toNamed('/message',
                  arguments: {'index': index, 'roomId': controller.roomId});
            }));
  }
}
