import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/post_list.dart';

import 'package:enft/app/ui/post_list/components/body.dart';

import '../../controller/user.dart';
import '../gym_explore/gym_explore.dart';

class PostListPage extends GetView<PostListController> {
  PostListPage({Key? key}) : super(key: key);

  final isFloatingDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (isFloatingDialOpen.value) {
            isFloatingDialOpen.value = false;

            return false;
          } else {
            return true;
          }
        },
        child: Obx(() => Scaffold(
              appBar: buildAppBar(),
              backgroundColor: Colors.grey[50],
              body: controller.isPostPage ? PostListBody() : GymExplorePage(),
              floatingActionButton: buildFloatingActionButton(context),
            )));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 4),
        child: Row(children: [
          GestureDetector(
              onTap: () => Get.toNamed('location'),
              child: Row(
                children: [
                  Obx(() => Text(
                        UserController.to.user.location.split(" ").last,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Icon(Icons.keyboard_arrow_down_rounded)
                ],
              )),
        ]),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey[50],
      elevation: 0,
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      openCloseDial: isFloatingDialOpen,
      children: controller.isPostPage
          ? [
              SpeedDialChild(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  labelBackgroundColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                  onTap: () => controller.isPostPage = !controller.isPostPage,
                  child: Icon(Icons.storefront_rounded),
                  label: '헬스장 찾아보기'),
              SpeedDialChild(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  labelBackgroundColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                  onTap: () => Get.toNamed('/post/write'),
                  child: Icon(Icons.create_rounded),
                  label: '게시글 글쓰기')
            ]
          : [
              SpeedDialChild(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  labelBackgroundColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                  onTap: () => controller.isPostPage = !controller.isPostPage,
                  child: Icon(Icons.space_dashboard_rounded),
                  label: '게시글 찾아보기')
            ],
    );
  }
}
