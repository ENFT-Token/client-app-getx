import 'package:enft/app/ui/post_list/components/test_overlap.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/ui/post_list/components/body.dart';

import 'package:enft/app/ui/write_post/write_post.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  final bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: isTrue
          ? Stack(
              children: [TestOverlap(), PostListBody()],
            )
          : PostListBody(),
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
        ],
      ),
    );
  }
}
