import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import '../../../controller/gym_explore.dart';
import 'list_item.dart';

class GymExploreBody extends GetView<GymExploreController> {
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
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              color: Colors.white,
                              child: CustomListItem(
                                thumbnail: controller.list[index].cover_img,
                                title: controller.list[index].place,
                                location: controller.list[index].location,
                                klayInfo: controller.list[index].list,
                                gymInfo: controller.list[index],
                              )),
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2)),
                    )))
          ],
        ));
  }
}
