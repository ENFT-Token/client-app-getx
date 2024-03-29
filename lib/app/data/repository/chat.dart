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
    final List result = await apiClient.getChatList(nickname);
    List chatList = List.empty(growable: true);

    print("getChatList repository ${result}");

    if (result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        print("result ${result[i]}");
        print(result[i]['user']);
        String profile = (result[i]['user'])['profile'];
        print(profile);
        chatList.add(Chat(
            roomId: result[i]['roomId'],
            image: File(profile),
            name: getChatUser(result[i]['roomId']),
            lastMessage: result[i]['chat'][0]['msg'],
            time: distanceTimeFromNow(
                DateTime.parse(result[i]['chat'][0]['sendAt'])
                    .add(const Duration(hours: 9))),
            timeStamp: DateTime.parse(result[i]['chat'][0]['sendAt'])));
      }
    }

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
