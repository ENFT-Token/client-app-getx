import 'dart:io';

import 'package:get/get.dart';

import 'package:enft/app/data/model/chat.dart';
import 'package:enft/app/data/provider/chat_api.dart';
import 'package:intl/intl.dart';

import '../../controller/user.dart';
import '../provider/message_socket.dart';

class ChatRepository {
  final ChatApiClient apiClient;
  final MessageSocketClient socketClient;

  late Chat chat;

  ChatRepository({required this.apiClient, required this.socketClient});

  initChat() => chat = Chat(
      roomId: "",
      image: "",
      name: "",
      lastMessage: "",
      time: "",
      timeStamp: DateTime.now());

  getChatList(String nickname) async {
    final result = await apiClient.getChatList(nickname);
    List chatList = List.empty(growable: true);

    result.forEach((element) {
      print("element ${element['chat'].length}");
      chatList.add(Chat(
          roomId: element['roomId'],
          image: File(element['user']['profile']),
          name: getChatUser(element['roomId']),
          lastMessage: element['chat'][0]['msg'],
          time:
              distanceTimeFromNow(DateTime.parse(element['chat'][0]['sendAt'])),
          timeStamp: DateTime.parse(element['chat'][0]['sendAt'])));
      // chatList.add(Chat(
      //     image: "assets/photos/basic-profile.jpg",
      //     name: getChatUser(element['roomId']),
      //     lastMessage: "안녕하세요",
      //     time: "7분 전"));
    });
    return chatList;
  }

  getChatUser(String roomId) {
    var nickname;
    roomId.split(" ").forEach((element) {
      if (element != UserController.to.user.nickname) {
        nickname = element;
      }
    });
    return nickname;
  }

  getChatUserProfileByNickname(String chatUserNickname) async =>
      (await apiClient.getChatUserProfileByNickname(chatUserNickname));

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
