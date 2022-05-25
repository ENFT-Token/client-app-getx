import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/post.dart';
import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';

import 'package:enft/app/ui/post_list/components/body.dart';

import '../../controller/user.dart';
import '../gym_explore/gym_explore.dart';

class PostListPage extends GetView<PostController> {
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
      title: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () => Get.toNamed('location'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
                child: Row(
                  children: [
                    Obx(() => Text(
                          UserController.to.user.location.split(" ").last,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                    Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                )),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      automaticallyImplyLeading: false,
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey[50],
      elevation: 0.2,
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: kPrimaryColor,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      openCloseDial: isFloatingDialOpen,
      children: controller.isPostPage
          ? [
              SpeedDialChild(
                  backgroundColor: kPrimaryLightColor,
                  foregroundColor: Colors.white,
                  labelBackgroundColor: kPrimaryLightColor,
                  labelStyle: TextStyle(color: Colors.white),
                  onTap: () => controller.isPostPage = !controller.isPostPage,
                  child: Icon(Icons.storefront_rounded),
                  label: '헬스장 찾아보기'),
              SpeedDialChild(
                  backgroundColor: kPrimaryLightColor,
                  foregroundColor: Colors.white,
                  labelBackgroundColor: kPrimaryLightColor,
                  labelStyle: TextStyle(color: Colors.white),
                  onTap: () => Get.toNamed('/post/write'),
                  child: Icon(Icons.create_rounded),
                  label: '게시글 글쓰기')
            ]
          : [
              SpeedDialChild(
                  backgroundColor: kPrimaryLightColor,
                  foregroundColor: Colors.white,
                  labelBackgroundColor: kPrimaryLightColor,
                  labelStyle: TextStyle(color: Colors.white),
                  onTap: () => controller.isPostPage = !controller.isPostPage,
                  child: Icon(Icons.space_dashboard_rounded),
                  label: '게시글 찾아보기')
            ],
    );
  }
}
