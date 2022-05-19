import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/ticket.dart';

class Ticket extends GetView<TicketController> {
  Ticket({Key? key, required this.index, required this.detail})
      : super(key: key);

  late int index;
  final Widget detail;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final height = width * 1.618;
    final double _scaleFactor = 0.8;

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
                  child: AnimatedBuilder(
                      animation: controller.backgroundGradientController,
                      builder: (_, child) {
                        return Stack(alignment: Alignment.center, children: [
                          ShaderMask(
                            child: Image(
                              image:
                                  AssetImage("assets/backgrounds/ticket.png"),
                              width: width,
                              height: height,
                            ),
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    controller
                                        .backgroundGradientAnimationForward
                                        .value,
                                    controller
                                        .backgroundGradientAnimationReverse
                                        .value
                                  ]).createShader(bounds);
                            },
                            blendMode: BlendMode.srcATop,
                          ),
                          detail
                        ]);
                      })));
        }, onLoading: CircularProgressIndicator());
      },
    );
  }
}
