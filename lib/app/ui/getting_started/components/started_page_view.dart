import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/getting_started.dart';
import 'package:enft/app/ui/getting_started/components/slide_dots.dart';
import 'package:enft/app/ui/getting_started/components/slide_item.dart';

class StartedPageView extends GetView<GettingStartedController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Obx(() => PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller.controller.value,
            onPageChanged: controller.onPageChanged,
            itemCount: slideList.length,
            itemBuilder: (context, index) => SlideItem(index))),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Obx(() => Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < slideList.length; i++)
                      if (i == controller.page.value)
                        SlideDots(true)
                      else
                        SlideDots(false)
                  ],
                ))
          ],
        )
      ],
    );
  }
}
