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
    return ListView(
      children: <Widget>[
        CustomListItem(
          thumbnail: null,
          title: 'ENFT 헬스장 이용권 판매합니다',
          position: '화성시 기산동',
          readDuration: '5분 전',
          price: '300,000원',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[0])));
          },
        ),
        CustomListItem(
          thumbnail: null,
          title: 'MBTI 헬스장 이용권 판매합니다',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[1])));
          },
        ),
        CustomListItem(
          thumbnail: null,
          title: '케어핏 헬스장 이용권 양도합니다',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[2])));
          },
        ),
        CustomListItem(
          thumbnail: null,
          title: 'SS휘트니스클럽 이용권 양도합니다',
          position: '수원시 권선동',
          readDuration: '2일 전',
          price: '',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostPage(post: postList[0], user: userList[3])));
          },
        ),
        CustomListItem(
          thumbnail: null,
          title: '휘트니스클럽W 이용권 양도합니다',
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
