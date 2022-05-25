import 'package:flutter/material.dart';

import 'package:enft/app/ui/chat/components/body.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: ChatBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0.5,
      title: Row(children: [
        Expanded(child: Text("채팅")),
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ]),
    );
  }
}
