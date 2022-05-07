import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/data/model/chat.dart';

import 'package:enft/app/data/repository/chat.dart';

class ChatController extends GetxController {
  static ChatController get to => Get.find<ChatController>();

  ChatRepository repository;

  ChatController({required this.repository}) {
    initChat();
  }

  @override
  onInit() async {
    await getChatList();
  }

  late var _chat;
  List<dynamic> _chatList = List.empty(growable: true).obs;
  String _roomId = "";

  get chat => _chat.value;

  set chat(value) => _chat.value = value;

  get chatList => _chatList;

  set chatList(value) => _chatList = value;

  get roomId => _roomId;

  set roomId(value) => _roomId = value;

  initChat() {
    repository.initChat();
    _chat = repository.chat.obs;
    // chatList = chatDataList;
  }

  getChatList() async =>
      chatList = await repository.getChatList(UserController.to.user.nickname);
}
