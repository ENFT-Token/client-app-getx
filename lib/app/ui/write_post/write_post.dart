import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/post.dart';
import 'package:enft/app/ui/write_post/components/body.dart';

class WritePostPage extends GetView<PostController> {
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
      backgroundColor: Colors.grey[50],
      elevation: 1,
      actions: [
        TextButton(
            onPressed: () async {
              await controller.writePost();
              Get.back();
            },
            child: Text(
              "완료",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ))
      ],
      leading: IconButton(
          icon: Icon(Icons.close_outlined), onPressed: () => Get.back()),
      title: Text("글쓰기"),
    );
  }
}
