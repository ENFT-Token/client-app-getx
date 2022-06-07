import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/chat.dart';

import 'package:enft/app/data/model/message.dart';

import 'package:enft/app/data/repository/message.dart';

import '../data/model/chat.dart';

class MessageController extends GetxController with StateMixin<List> {
  static MessageController get to => Get.find<MessageController>();

  MessageRepository repository;

  MessageController({required this.repository}) {
    initMessage();
    initializeDateFormatting("ko_KR");
    Intl.defaultLocale = "ko_KR";
  }

  @override
  void onInit() async {
    roomId = ChatController.to.roomId;
    messageList = await repository.getMessageList(roomId);
    if (!messageList.isEmpty) repository.socketClient.joinChatRoom(roomId);
    initMessage();
    super.onInit();
  }

  @override
  void onReady() {
    _messageList.refresh();
    super.onReady();
  }

  @override
  onClose() {
    if (!messageList.isEmpty) repository.socketClient.leaveChatRoom(roomId);
    msgEditingController.dispose();
    super.onClose();
  }

  late var _message;
  RxList<dynamic> _messageList = List.empty(growable: true).obs;
  RxString _roomId = "".obs;

  TextEditingController msgEditingController = TextEditingController();

  get message => _message.value;

  set message(value) => _message.value = value;

  get messageList => _messageList.value;

  set messageList(value) => _messageList.value = value;

  get roomId => _roomId.value;

  set roomId(value) => _roomId.value = value;

  initMessage() => _message = repository.initMessage();

  sendTextMessage(String nickname, String text) async {
    int chatRoomIndex = ChatController.to.chatList.indexWhere((element) {
      List splitRoomId = roomId.split(" ");
      int checkRoomId = 0;

      splitRoomId.forEach((nickname) {
        if (element.roomId.contains(nickname)) {
          checkRoomId += 1;
        }
      });

      bool test = checkRoomId == 2 ? true : false;

      return test;
    });

    bool isChatRoomExist = chatRoomIndex == -1 ? false : true;

    if (isChatRoomExist) {
      ChatController.to.chatList[chatRoomIndex].lastMessage = text;
      ChatController.to.chatList[chatRoomIndex].time =
          ChatController.to.repository.distanceTimeFromNow(DateTime.now());
      ChatController.to.chatList[chatRoomIndex].timeStamp = DateTime.now();
    } else {
      ChatController.to.chatList.add(Chat(
          image: File(
              await ChatController.to.getChatUserProfileByNickname(nickname)),
          roomId: roomId,
          lastMessage: text,
          time:
              ChatController.to.repository.distanceTimeFromNow(DateTime.now()),
          timeStamp: DateTime.now()));
    }

    if (messageList.isEmpty) {
      repository.socketClient.joinChatRoom(roomId);
    }
    _messageList.add(repository.sendTextMessage(
        UserController.to.user.profile.path, roomId, nickname, text));
    _messageList.refresh();
  }

  sendImageMessage(String nickname, List<String>? images) async {
    int chatRoomIndex = ChatController.to.chatList.indexWhere((element) {
      List splitRoomId = roomId.split(" ");
      int checkRoomId = 0;

      splitRoomId.forEach((nickname) {
        if (element.roomId.contains(nickname)) {
          checkRoomId += 1;
        }
      });

      bool test = checkRoomId == 2 ? true : false;

      return test;
    });

    bool isChatRoomExist = chatRoomIndex == -1 ? false : true;

    if (isChatRoomExist) {
      ChatController.to.chatList[chatRoomIndex].lastMessage = "이미지를 보냈습니다.";
      ChatController.to.chatList[chatRoomIndex].time =
          ChatController.to.repository.distanceTimeFromNow(DateTime.now());
      ChatController.to.chatList[chatRoomIndex].timeStamp = DateTime.now();
    } else {
      ChatController.to.chatList.add(Chat(
          image: File(
              await ChatController.to.getChatUserProfileByNickname(nickname)),
          roomId: roomId,
          lastMessage: "이미지를 보냈습니다.",
          time:
              ChatController.to.repository.distanceTimeFromNow(DateTime.now()),
          timeStamp: DateTime.now()));
    }
    if (messageList.isEmpty) repository.socketClient.joinChatRoom(roomId);
    _messageList.add(repository.sendImageMessage(
        UserController.to.user.profile.path, roomId, nickname, images));
  }

  receiveMessage(Map<String, dynamic> data) {
    switch (data['type']) {
      case 'text':
        message = Message(
            text: data['msg'],
            images: null,
            messageType: MessageType.text,
            time: DateFormat.yMd().add_jm().format(
                DateTime.parse(data['sendAt']).add(const Duration(hours: 9))),
            isSender: false);
        break;

      case 'image':
        message = Message(
            text: null,
            images: data['msg'],
            messageType: MessageType.text,
            time: DateFormat.yMd().add_jm().format(
                DateTime.parse(data['sendAt']).add(const Duration(hours: 9))),
            isSender: false);
        break;

      default:
        break;
    }
    _messageList.add(message);
    _messageList.refresh();
  }

  String distanceTimeFromNow(DateTime originDateTime) {
    String timeFromNow;
    DateTime now = DateTime.now();
    int distance;

    distance = DateTime(now.year, now.month, now.day, now.hour, now.minute)
        .difference(DateTime(originDateTime.year, originDateTime.month,
            originDateTime.day, originDateTime.hour, originDateTime.minute))
        .inMinutes;

    if (distance ~/ 60 != 0) {
      if (distance ~/ (60 * 24) != 0) {
        if (distance ~/ (60 * 24 * 30) != 0) {
          if (distance ~/ (60 * 24 * 365) != 0) {
            timeFromNow = (distance ~/ (60 * 24 * 365)).toString() + "년 전";
            return timeFromNow;
          }
          timeFromNow = (distance ~/ (60 * 24 * 30)).toString() + "달 전";
          return timeFromNow;
        }
        timeFromNow = (distance ~/ (60 * 24)).toString() + "일 전";
        return timeFromNow;
      }
      timeFromNow = (distance ~/ (60)).toString() + "시간 전";
      return timeFromNow;
    } else {
      timeFromNow = distance.toString() + "분 전";
    }
    return timeFromNow;
  }
}
