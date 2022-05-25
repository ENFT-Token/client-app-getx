import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/data/model/post.dart';
import 'package:enft/app/data/repository/post.dart';

class PostController extends GetxController {
  static PostController get to => Get.find<PostController>();
  final PostRepository repository;

  PostController({required this.repository});

  // post는 들어갈 때마다 새로 초기화 해줘야 되니까 재생성 되어야한다.
  // PostList는 새로 초기화 안해줘도 된다.

  RxBool _isPostPage = true.obs;
  RxBool _isFloatingDialOpen = false.obs;
  RxList<Post> _postList = List<Post>.empty(growable: true).obs;
  RxString _title = "".obs;
  RxString _content = "".obs;
  RxDouble _cost = 0.0.obs;
  RxList<File> _images = List<File>.empty(growable: true).obs;

  get isPostPage => _isPostPage.value;

  set isPostPage(value) => _isPostPage.value = value;

  get isFloatingDialOpen => _isFloatingDialOpen;

  set isFloatingDialOpen(value) => _isFloatingDialOpen.value = value;

  get postList => _postList.value;

  set postList(value) => _postList.value = value;

  get title => _title.value;

  set title(value) => _title.value = value;

  get content => _content.value;

  set content(value) => _content.value = value;

  get cost => _cost.value;

  set cost(value) => _cost.value = value;

  get images => _images.value;

  set images(value) => _images.value;

  writePost() async {
    print(images);
    Map<String, dynamic> data = {
      'title': title,
      'content': content,
      'cost': cost.toString(),
      'location': UserController.to.user.location,
    };

    await repository.writePost(
        data, images, UserController.to.user.access_token);
  }

  getPost() async => postList = await repository.getPost();
}
