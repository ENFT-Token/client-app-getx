import 'dart:io';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/data/model/chat.dart';

import 'package:enft/app/data/repository/chat.dart';

import 'message.dart';

class ChatController extends GetxController {
  static ChatController get to => Get.find<ChatController>();

  ChatRepository repository;

  ChatController({required this.repository});

  @override
  onInit() async {
    repository.socketClient.receiveCallback = receiveMessage;
    repository.socketClient.socket.connect();
    await getChatList();
  }

  @override
  onClose() async {
    repository.socketClient.socket.disconnect();
    super.onClose();
  }

  late var _chat;
  RxList<dynamic> _chatList = List.empty(growable: true).obs;
  String _roomId = "";

  get chat => _chat.value;

  set chat(value) => _chat.value = value;

  get chatList => _chatList.value;

  set chatList(value) => _chatList.value = value;

  get roomId => _roomId;

  set roomId(value) => _roomId = value;

  getChatList() async {
    chatList = await repository.getChatList(UserController.to.user.nickname);
    print(chatList.runtimeType);
    _chatList.refresh();
  }

  getChatUserProfileByNickname(String chatUserNickname) async =>
      await repository.getChatUserProfileByNickname(chatUserNickname);

  receiveMessage(Map<String, dynamic> data) async {
    int chatRoomIndex = _chatList.indexWhere((element) {
      List splitRoomId = data['roomId'].split(" ");
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
      _chatList[chatRoomIndex].lastMessage = data['msg'];
      _chatList[chatRoomIndex].time =
          repository.distanceTimeFromNow(DateTime.parse(data['sendAt']));

      bool isMessageControllerExists =
          Get.isRegistered<MessageController>(tag: roomId);
      if (isMessageControllerExists) {
        Get.find<MessageController>(tag: roomId).receiveMessage(data);
      }
    } else {
      _chatList.add(Chat(
          roomId: roomId,
          image: File(await getChatUserProfileByNickname(data['userName'])),
          name: repository.getChatUser(data['roomId']),
          lastMessage: data['msg'],
          time:
              repository.distanceTimeFromNow(DateTime.parse(data['sendAt']))));
    }
    _chatList.refresh();
  }
}
