import 'package:enft/app/controller/chat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:blue/src/page/post/post.dart';

import 'package:enft/app/ui/post_list/components/list_item.dart';

// 이 아래는 테스트
import '../../../binding/image.dart';
import '../../../binding/user.dart';
import '../../../controller/message.dart';
import '../../../controller/user.dart';
import '../../../data/model/chat.dart';
import '../../../data/provider/message_api.dart';
import '../../../data/provider/message_socket.dart';
import '../../../data/repository/message.dart';
import '../../message/message.dart';

class PostListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        OutlinedButton(
            onPressed:  () {
              ChatController.to.roomId = UserController.to.user.content +
                  " " +
                  "enft";
              ChatController.to.chatList.add(Chat(
                  image: "assets/photos/basic-profile.jpg",
                  name: "enft",
                  lastMessage: "안녕하세요",
                  time: "5분 전"));
              Get.to(() => MessagePage(),
                  arguments: {'index': ChatController.to.chatList.length-1, 'roomId': ChatController.to.roomId, 'tag': ChatController.to.roomId},
                  binding: BindingsBuilder(() {
                    Get.put<MessageController>(
                        MessageController(
                            repository: MessageRepository(
                                socketClient: MessageSocketClient(),
                                apiClient: MessageApiClient())),
                        tag: ChatController.to.roomId);
                    ImageBinding();
                    UserBinding();
                  }));
            },
            child: Text("발급 요청")),
        CustomListItem(
          thumbnail: Container(
            decoration: BoxDecoration(
                color: Colors.pink, borderRadius: BorderRadius.circular(10)),
          ),
          title: '맥북 프로 터치바 13인치 16년 판매합니다',
          position: '화성시 기산동',
          readDuration: '5분 전',
          price: '600,000원',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[0])));
          },
        ),
        CustomListItem(
          thumbnail: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          title: '맥북 에어 m1을 아이패드 프로 12.9 4세대+스마트 키보드와 교환 원합니다',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[1])));
          },
        ),
        CustomListItem(
          thumbnail: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          title: '맥북 에어 m1을 아이패드 프로 12.9 4세대+스마트 키보드와 교환 원합니다. 흥정 가능',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[2])));
          },
        ),
        CustomListItem(
          thumbnail: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          title: '맥북 에어 m1을 아이패드 프로 12.9 4세대+스마트 키보드와 교환 원합니다',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[3])));
          },
        ),
        CustomListItem(
          thumbnail: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          title: '맥북 에어 m1을 아이패드 프로 12.9 4세대+스마트 키보드와 교환 원합니다',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[0])));
          },
        ),
      ],
    );
  }
}