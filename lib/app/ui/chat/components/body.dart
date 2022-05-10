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
              // 빠르게 채팅방을 바꿀 때, 채팅 내역이 중복되는 현상을 막기 위해서는 tag가 필요하다.
              // 하지만 Get.toNamed()와 MessageBinding()으로는 이러한 문제를 해결할 수가 없었다.
              // 그래서 현재 이렇게 되었다. 근데 UI 로직에 이게 맞나...?? 이런게 항상 고민이다 ;ㅅ;
              // 해야하긴 하는데.. 흠... 분리는 못하고... 이래서 오픈소스에 새로운 기능을 추가하려고 기여하나...?
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
