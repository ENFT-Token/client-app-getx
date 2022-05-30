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
    await getChatList();
    initSocket();
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

  initSocket() {
    repository.socketClient.initSocket();
    repository.socketClient.socket.connect();
  }

  getChatList() async {
    chatList = await repository.getChatList(UserController.to.user.nickname);
    print(chatList.runtimeType);
    _chatList.refresh();
  }

  receiveMessage(Map<String, dynamic> data) {
    int chatRoomIndex =
        _chatList.value.indexOf((element) => element.roomId == data['roomId']);
    bool isChatRoomExist = chatRoomIndex == -1 ? false : true;

    if (isChatRoomExist) {
      _chatList.value[chatRoomIndex].lastMessage = data['msg'];
      _chatList.value[chatRoomIndex].time =
          repository.distanceTimeFromNow(DateTime.parse(data['sendAt']));

      bool isMessageControllerExists =
          Get.isRegistered<MessageController>(tag: roomId);
      if (isMessageControllerExists) {
        Get.find<MessageController>(tag: roomId).receiveMessage(data);
      }
    } else {
      _chatList.value.add(Chat(
          image: File(data['profilePath']),
          name: repository.getChatUser(roomId),
          lastMessage: data['msg'],
          time:
              repository.distanceTimeFromNow(DateTime.parse(data['sendAt']))));
    }
  }
}
