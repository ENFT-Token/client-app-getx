import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/chat.dart';

import 'package:enft/app/data/model/message.dart';

import 'package:enft/app/data/repository/message.dart';

class MessageController extends GetxController with StateMixin<List> {
  static MessageController get to => Get.find<MessageController>();

  MessageRepository repository;

  MessageController({required this.repository}) {
    repository.socketClient.receiveCallback = receiveMessage;
    initMessage();
    initializeDateFormatting("ko_KR");
    Intl.defaultLocale = "ko_KR";
  }

  @override
  void onInit() async {
    roomId = ChatController.to.roomId;
    scrollController = ScrollController()..addListener(_scrollListener);
    messageList = await repository.getMessageList(roomId);
    initMessage();
    initSocket();
    super.onInit();
  }

  @override
  void onReady() {
    _messageList.refresh();
    super.onReady();
  }

  @override
  onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    repository.socketClient.socket.disconnect();
    super.onClose();
  }

  late var _message;
  RxList<dynamic> _messageList = List.empty(growable: true).obs;
  RxString _roomId = "".obs;
  late ScrollController scrollController;

  get message => _message.value;

  set message(value) => _message.value = value;

  get messageList => _messageList.value;

  set messageList(value) => _messageList.value = value;

  get roomId => _roomId.value;

  set roomId(value) => _roomId.value = value;

  void _scrollListener() async {
    print(scrollController.position.extentAfter);
    if (scrollController.position.extentAfter < 500) {
      _messageList.add(await repository.getMessageList(roomId));
      _messageList.refresh();
    }
  }

  initMessage() => _message = repository.initMessage();

  initSocket() {
    repository.socketClient.initSocket(roomId);
    repository.socketClient.socket.connect();
  }

  sendTextMessage(String nickname, String text) {
    _messageList.add(repository.sendTextMessage(roomId, nickname, text));
    _messageList.refresh();
  }

  sendImageMessage(String nickname, List<String>? images) =>
      _messageList.add(repository.sendImageMessage(roomId, nickname, images));

  receiveMessage(Map<String, dynamic> data) {
    switch (data['type']) {
      case 'text':
        message = Message(
            text: data['msg'],
            images: null,
            messageType: MessageType.text,
            time: DateFormat.yMd().add_jm().format(DateTime.parse(data['sendAt'])),
            isSender: false);
        break;

      case 'image':
        message = Message(
            text: null,
            images: data['msg'],
            messageType: MessageType.text,
            time: DateFormat.yMd().add_jm().format(DateTime.parse(data['sendAt'])),
            isSender: false);
        break;

      default:
        break;
    }
    _messageList.add(message);
    _messageList.refresh();
  }
}
