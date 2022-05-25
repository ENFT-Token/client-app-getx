import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';
import 'package:enft/app/ui/send_ticket/components/possessed_ticket.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import '../../../controller/gym_explore.dart';
import '../../register/components/text_field_container.dart';
import 'list_item.dart';

class GymExploreBody extends GetView<GymExploreController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(controller.list.length, (index) {
      return CustomListItem(
        thumbnail: controller.list[index].cover_img,
        title: controller.list[index].place,
        location: controller.list[index].location,
        klayInfo: controller.list[index].list,
      );
    }));
  }
}
