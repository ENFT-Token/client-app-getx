import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/data/model/message.dart';

import 'package:enft/app/ui/message/components/audio_message.dart';
import 'package:enft/app/ui/message/components/text_message.dart';
import 'package:enft/app/ui/message/components/image_message.dart';
import 'package:enft/app/ui/message/components/video_message.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    Widget messageContain(Message message) {
      switch (message.messageType) {
        case MessageType.text:
          return TextMessage(message: message);
          break;
        case MessageType.image:
          return ImageMessage(message: message);
        case MessageType.audio:
          return AudioMessage(message: message);
          break;
        case MessageType.video:
          return VideoMessage(message: message);
          break;
        default:
          return SizedBox();
      }
    }

    return Padding(
        padding: const EdgeInsets.only(top: kDefaultPadding),
        child: Row(
          mainAxisAlignment: message.isSender
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (message.isSender) ...[
              Text(message.time.substring(message.time.indexOf("오"))),
              SizedBox(
                width: kDefaultPadding / 2,
              )
            ],
            Row(
              mainAxisAlignment: message.isSender
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!message.isSender) ...[
                  CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage("assets/photos/basic-profile.jpg"),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  )
                ],
                messageContain(message),
                if (!message.isSender) ...[
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                ]
              ],
            ),
            if (!message.isSender) ...[
              Text(message.time.substring(message.time.indexOf("오"))),
              SizedBox(
                width: kDefaultPadding / 2,
              )
            ],
          ],
        ));
  }
}
