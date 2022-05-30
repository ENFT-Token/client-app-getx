import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/post_list.dart';

import 'package:enft/app/ui/post_list/components/list_item.dart';

class PostListBody extends GetView<PostListController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                color: Colors.white,
                child: Text(
                  "[공지] 커뮤니티 이용 안내",
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(
              height: 2,
            ),
            Expanded(
                child: Obx(() => ListView.separated(
                      itemCount: controller.postList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        color: Colors.white,
                        child: CustomListItem(
                            thumbnail: controller.postList[index].images.isEmpty
                                ? null
                                : controller.postList[index].images[0],
                            title: controller.postList[index].title,
                            nickname: controller.postList[index].nickname,
                            readDuration: controller.distanceTimeFromNow(
                                controller.postList[index].createAt),
                            cost: controller.postList[index].cost,
                            onTap: () => controller.toPost(index)),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2)),
                    )))
          ],
        ));
  }
}
