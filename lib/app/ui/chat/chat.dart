import 'package:flutter/material.dart';

import 'package:enft/app/ui/chat/components/body.dart';

import '../../constant/constant.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), backgroundColor: Colors.grey[50], body: ChatBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0.5,
      title: Row(children: [
        Expanded(
            child: Text(
          "채팅",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ]),
    );
  }
}
