import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/post_list.dart';
import 'package:enft/app/ui/write_post/components/body.dart';

class WritePostPage extends GetView<PostListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.grey[50],
      body: WriteBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey[50],
      elevation: 1,
      actions: [
        TextButton(
            onPressed: () async {
              await controller.writePost();
              controller.images = List<File>.empty(growable: true).obs;
              Get.back();
            },
            child: Text(
              "완료",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ))
      ],
      title: Text("게시글 글쓰기"),
    );
  }
}
