import 'package:enft/app/controller/splash.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/ui/home/home.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  final double _bigFontSize = 178;

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.end,
                      runAlignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Obx(() => AnimatedContainer(
                                width: !controller.isExpanded.value ? _bigFontSize : 90,
                                // height: !expanded ? _bigFontSize : 90,
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeInOut,
                                child: Image.asset(
                                  "assets/logos/logo_e.png",
                                ),
                              ),),
                              Obx(() => AnimatedCrossFade(
                                firstCurve: Curves.fastOutSlowIn,
                                // the same curve as above
                                crossFadeState: !controller.isOpacity.value
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 1000),
                                // the same duration as above
                                firstChild: Container(),
                                // an empty container
                                secondChild: Image.asset(
                                  "assets/logos/logo_nft.png",
                                  width: 100,
                                ),
                                // a Row containing rest of our logo
                                alignment: Alignment.centerLeft,
                                // "reveal" the logo from the center left
                                sizeCurve: Curves.easeInOut,
                              ),)
                            ]),
                        Obx(() => AnimatedOpacity(
                          opacity: !controller.isOpacity.value ? 0 : 1.0,
                          duration: const Duration(milliseconds: 3000),
                          child: Image.asset(
                            "assets/logos/logo_essential_nft.png",
                            width: 156.25,
                          ),
                        )),
                      ],
                    ),
                    Obx(() => AnimatedContainer(
                      width: !controller.isExpanded.value ? 0 : 22.5,
                      // height: !expanded ? _bigFontSize : 90,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    )),
                  ],
                )
              ],
            ));
  }
}
