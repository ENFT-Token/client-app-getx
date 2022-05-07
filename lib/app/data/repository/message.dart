import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:enft/app/data/model/message.dart';
import 'package:enft/app/data/provider/message_socket.dart';
import 'package:enft/app/data/provider/message_api.dart';

class MessageRepository {
  late MessageSocketClient socketClient;
  late MessageApiClient apiClient;

  MessageRepository({required this.socketClient, required this.apiClient});

  initMessage() => Message(
          text: null,
          images: null,
          messageType: MessageType.text,
          time: DateFormat.yMd().add_jm().format(DateTime.now()),
          isSender: true)
      .obs;

  sendTextMessage(String roomId, String nickname, String text) {
    socketClient.sendTextMessage(roomId, nickname, text);
    print(text);
    return Message(
        text: text,
        images: null,
        messageType: MessageType.text,
        time: DateFormat.yMd().add_jm().format(DateTime.now()),
        isSender: true);
  }

  sendImageMessage(String roomId, String nickname, List<String>? images) {
    socketClient.sendImageMessage(roomId, nickname, images);
    return Message(
        text: null,
        images: images,
        messageType: MessageType.image,
        time: DateFormat.yMd().add_jm().format(DateTime.now()),
        isSender: true);
  }

  getMessageList(String roomId) async {
    final result = await apiClient.getMessageList(roomId);

    var messageList = List.empty(growable: true);
    var nickname = roomId.split(" ")[0];

    int i = 0;

    result.forEach((element) {
      final time = element['sendAt'].substring(0, 10) +
          " " +
          element['sendAt'].substring(11, 19);
      messageList.add(Message(
          text: element['msg'],
          images: null,
          messageType: MessageType.text,
          time: DateFormat.yMd()
              .add_jm()
              .format(DateFormat('mm-dd-yyyy hh:mm:ss').parse(time)),
          isSender: nickname == element['senderName'] ? true : false));
    });
    return messageList;
  }
}
