import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/chat.dart';
import 'package:enft/app/controller/message.dart';
import 'package:enft/app/controller/user.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/ui/message/components/img_upload_btn.dart';

class ChatInputField extends GetView {
  const ChatInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageController>(tag: Get.arguments['tag']);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: const Color(0x0ff08749).withOpacity(0.08),
            )
          ]),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: kPrimaryColor),
            const SizedBox(width: kDefaultPadding),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.64),
                  ),
                  const SizedBox(width: kDefaultPadding / 4),
                  Expanded(
                      child: TextField(
                    textInputAction: TextInputAction.go,
                    onSubmitted: (text) {
                      controller.sendTextMessage(UserController.to.user.nickname, text);
                    },
                    decoration: InputDecoration(
                        hintText: "메세지를 입력하세요", border: InputBorder.none),
                  )),
                  ImgUploadBtn(iconData: Icons.attach_file),
                  const SizedBox(width: kDefaultPadding / 4),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.64),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
