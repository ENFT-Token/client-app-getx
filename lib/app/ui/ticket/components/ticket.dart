import 'package:enft/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/ticket.dart';

class Ticket extends GetView<TicketController> {
  Ticket({required this.index, required this.detail});

  late int index;
  final Widget detail;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.675;
    final height = MediaQuery.of(context).size.height;
    final double _scaleFactor = 0.9;

    return Obx(
      () {
        if (index == controller.currPageValue.floor()) {
          var currScale =
              1.0 - (controller.currPageValue - index) * (1.0 - _scaleFactor);
          var currTrans = height * (1.0 - currScale) / 2.0;
          controller.matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0.0, currTrans, 0.0);
          controller.currOpacity = currScale;
        } else if (index == controller.currPageValue.floor() + 1) {
          var currScale = _scaleFactor +
              (controller.currPageValue - index + 1) * (1.0 - _scaleFactor);
          var currTrans = height * (1.0 - currScale) / 2.0;
          controller.matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0.0, currTrans, 0.0);
          controller.currOpacity = currScale - 0.2;
        } else if (index == controller.currPageValue.floor() - 1) {
          var currScale = _scaleFactor +
              (controller.currPageValue - index - 1) * (1.0 - _scaleFactor);
          var currTrans = height * (1.0 - currScale) / 2.0;
          controller.matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0.0, currTrans, 0.0);
          controller.currOpacity = currScale - 0.2;
        } else {
          var currScale = 0.8;
          controller.matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0.0, height * (1.0 - _scaleFactor) / 2.0, 0.0);
          controller.currOpacity = currScale - 0.2;
        }
        return controller.obx((state) {
          return Transform(
              transform: controller.matrix,
              child: Opacity(
                  opacity: controller.currOpacity,
                  child: Stack(alignment: Alignment.center, children: [
                    Image(
                      image: AssetImage("assets/backgrounds/ticket.jpg"),
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: height * 0.05,
                        left: width * 0.15,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(15 / 360),
                          child: Text("HEALTH",
                              style: TextStyle(
                                color: Colors.white10,
                                fontSize: height * 0.2,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -(width * 0.064),
                              )),
                        )),
                    Positioned(
                        top: height * 0.1625,
                        left: -(width * 0.3),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(15 / 360),
                          child: Text("FITNESS",
                              style: TextStyle(
                                color: Colors.white10,
                                fontSize: height * 0.2,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -(width * 0.065),
                              )),
                        )),
                    detail
                  ])));
        }, onLoading: CircularProgressIndicator());
      },
    );
  }
}
