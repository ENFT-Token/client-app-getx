import 'dart:io';

import 'package:enft/app/controller/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/data/model/post.dart';
import 'package:enft/app/data/repository/post.dart';

import '../binding/image.dart';
import '../ui/post/post.dart';

class PostListController extends GetxController {
  static PostListController get to => Get.find<PostListController>();
  final PostRepository repository;

  PostListController({required this.repository});

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

  getPost() async =>
      postList = await repository.getPost(UserController.to.user.location);

  toPost(int index) => Get.to(PostPage(), arguments: {'tag': index},
          binding: BindingsBuilder(() {
        Get.put<PostController>(PostController(), tag: index.toString());
        Get.find<PostController>(tag: index.toString()).post = postList[index];
        ImageBinding();
      }));

  String distanceTimeFromNow(DateTime originDateTime) {
    String timeFromNow;
    DateTime now = DateTime.now();
    int distance;

    distance = DateTime(now.year, now.month, now.day, now.hour, now.minute)
        .difference(DateTime(originDateTime.year, originDateTime.month,
            originDateTime.day, originDateTime.hour, originDateTime.minute))
        .inMinutes;

    if (distance ~/ 60 != 0) {
      if (distance ~/ (60 * 24) != 0) {
        if (distance ~/ (60 * 24 * 30) != 0) {
          if (distance ~/ (60 * 24 * 365) != 0) {
            timeFromNow = (distance ~/ (60 * 24 * 365)).toString() + "년 전";
            return timeFromNow;
          }
          timeFromNow = (distance ~/ (60 * 24 * 30)).toString() + "달 전";
          return timeFromNow;
        }
        timeFromNow = (distance ~/ (60 * 24)).toString() + "일 전";
        return timeFromNow;
      }
      timeFromNow = (distance ~/ (60)).toString() + "시간 전";
      return timeFromNow;
    } else {
      timeFromNow = distance.toString() + "분 전";
    }
    return timeFromNow;
  }
}
