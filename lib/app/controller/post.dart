import 'package:enft/app/controller/chat.dart';
import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/data/model/post.dart';

import '../binding/image.dart';
import '../data/model/chat.dart';
import '../data/provider/message_api.dart';
import '../data/provider/message_socket.dart';
import '../data/repository/message.dart';
import '../ui/message/message.dart';
import 'message.dart';

class PostController extends GetxController {
  late Post post;

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

  toChatRoom() {
    final roomId = UserController.to.user.nickname + " " + post.nickname;

    ChatController.to.roomId = roomId;
    ChatController.to.chatList.add(Chat(
        image: post.profile,
        roomId: roomId,
        name: post.nickname,
        lastMessage: "",
        time: "", timeStamp: DateTime.now()));

    Get.to(MessagePage(), arguments: {
      'index': ChatController.to.chatList
          .indexWhere((chat) => chat.name == post.nickname),
      'roomId': roomId,
      'tag': roomId
    }, binding: BindingsBuilder(() {
      Get.put<MessageController>(
          MessageController(
              repository: MessageRepository(
                  socketClient: MessageSocketClient(),
                  apiClient: MessageApiClient())),
          tag: roomId);
      ImageBinding();
    }));
  }
}
