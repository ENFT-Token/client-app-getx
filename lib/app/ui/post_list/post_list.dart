import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/ui/post_list/components/body.dart';

import 'package:enft/app/ui/write_post/write_post.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PostListBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        children: [],
      ),
      automaticallyImplyLeading: false,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0.2,
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed('/post/write'),
      child: Column(
        children: [
          Text("he"),
          Text("qweqw"),
          OutlinedButton(onPressed: () {}, child: Text("btn"))
        ],
      ),
    );
  }
}
