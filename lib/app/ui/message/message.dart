import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/chat.dart';
import 'package:enft/app/controller/message.dart';
import 'package:enft/app/ui/message/components/body.dart';
import 'package:intl/intl.dart';

class MessagePage extends GetView {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageController>(tag: Get.arguments['tag']);
    return Scaffold(appBar: buildAppBar(controller), body: MessageBody());
  }

  AppBar buildAppBar(MessageController controller) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(
            color: Colors.black,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(dotenv.env['SERVER_ADDRESS']! +
                ':3000' +
                ChatController.to.chatList[Get.arguments['index']].image.path),
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ChatController.to.chatList[Get.arguments['index']].name,
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Obx(() => Text(
                  controller.messageList.isEmpty
                      ? "없음"
                      : controller.distanceTimeFromNow(DateFormat.yMd()
                          .add_jm()
                          .parse(controller.messageList.last.time)),
                  style: TextStyle(color: Colors.black, fontSize: 14)))
            ],
          )
        ],
      ),
    );
  }
}
