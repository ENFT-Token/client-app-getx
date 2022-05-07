import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/chat.dart';
import 'package:enft/app/controller/message.dart';
import 'package:enft/app/ui/message/components/body.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: MessageBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage(
                ChatController.to.chatList[Get.arguments['index']].image),
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ChatController.to.chatList[Get.arguments['index']].name,
                  style: TextStyle(fontSize: 18)),
              Text(ChatController.to.chatList[Get.arguments['index']].time,
                  style: TextStyle(fontSize: 14))
            ],
          )
        ],
      ),
    );
  }
}
