import 'package:enft/app/data/model/chat.dart';
import 'package:enft/app/data/provider/chat_api.dart';

import '../../controller/user.dart';

class ChatRepository {
  final ChatApiClient apiClient;

  late Chat chat;

  ChatRepository({required this.apiClient});

  initChat() => chat = Chat(image: "", name: "", lastMessage: "", time: "");

  getChatList(String nickname) async {
    final result = await apiClient.getChatList(nickname);
    List chatList = List.empty(growable: true);
    result.forEach((element) {
      chatList.add(Chat(
          image: "assets/photos/basic-profile.jpg",
          name: getChatUser(element['roomId']),
          lastMessage: "안녕하세요",
          time: "7분 전"));
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
}
