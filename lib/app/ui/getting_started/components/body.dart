import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/klip.dart';

import 'package:enft/app/ui/getting_started/components/klip_login_button.dart';
import 'package:enft/app/ui/getting_started/components/started_page_view.dart';

import 'package:enft/app/ui/loading_hud/loading_hud.dart';

class GettingStartedBody extends GetView<KlipController> {
  const GettingStartedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double heightPadding = kDefaultPadding * 2;
    double heightKlipLoginButton = 56;
    double heightStartedPageView = width / 1.5 + 106;
    double paddingSlideDotsFromBtn = (height -
            (heightPadding + heightKlipLoginButton + heightStartedPageView)) /
        4;

    return SafeArea(
        child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: <Widget>[
                    Expanded(child: StartedPageView()),
                    SizedBox(height: paddingSlideDotsFromBtn),
                    KlipLoginButton(onPressed: () async {
                      controller.getAddress(context);
                      // if(loadingHud.isLoading) loadingHud.hideHud();
                    }),
                  ],
                ),
              )
            ]));
  }
}
