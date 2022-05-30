import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/post/components/photo_swiper.dart';
import 'package:enft/app/ui/post/components/writer_info.dart';
import 'package:enft/app/ui/post/components/main_text.dart';

import '../../../controller/post.dart';

class PostBody extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<PostController>(tag: Get.arguments['tag'].toString());

    final locationSplit = controller.post.location.split(" ");
    final location =
        locationSplit[locationSplit.length - 2] + " " + locationSplit.last;
    bool isImagesEmpty = controller.post.images.isEmpty;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (!controller.post.images.isEmpty)
            PhotoSwiper(photos: controller.post.images)
          else
            Padding(padding: const EdgeInsets.all(kDefaultPadding)),
          // SizedBox(height: kDefaultPadding,),
          Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WriterInfo(
                    nickname: controller.post.nickname,
                    location: location,
                    profile: controller.post.profile,
                  ),
                  Divider(
                    height: kDefaultPadding * 2,
                    thickness: 1,
                  ),
                  MainText(
                      title: controller.post.title,
                      content: controller.post.content,
                      during: controller
                          .distanceTimeFromNow(controller.post.createAt))
                ],
              ))
        ],
      ),
    );
  }
}
