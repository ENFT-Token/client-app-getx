import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/ui/ticket/components/none_ticket.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/ticket.dart';

import 'package:enft/app/ui/ticket/components/flip_card.dart';
import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:enft/app/ui/ticket/components/front_ticket.dart';
import 'package:enft/app/ui/ticket/components/back_ticket.dart';

class TicketPageView extends GetView<TicketController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;

    return Center(
        child: GestureDetector(
            onLongPress: () async => await UserController.to.updateNFT(),
            child: Obx(() => controller.obx(
                (state) => UserController.to.isUpdateNFT
                    ? CircularProgressIndicator()
                    : SizedBox(
                        child: UserController.to.user.klip.nfts.isEmpty
                            ? PageView.builder(
                                onPageChanged: (index) =>
                                    controller.selectedIndex = index,
                                controller: controller.pageController,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return FlipCard(
                                      controller: FlipCardController(),
                                      front: NoneTicket(
                                          index: index,
                                          description: "헬스장\n티켓이\n없어요"),
                                      back: NoneTicket(
                                          index: index,
                                          description: "헬스장\n티켓이\n없어요"));
                                })
                            : PageView.builder(
                                onPageChanged: (index) {
                                  controller.selectedIndex = index;
                                },
                                controller: controller.pageController,
                                // itemCount: 3,
                                itemCount:
                                    UserController.to.user.klip.nfts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FlipCard(
                                    controller: FlipCardController(),
                                    front: FrontTicket(
                                      index: index,
                                      place: UserController
                                          .to.user.klip.nfts[index]['place'],
                                      // qrData: "",
                                      qrData:
                                          UserController.to.qrDataList[index],
                                    ),
                                    back: BackTicket(
                                      index: index,
                                      place: UserController
                                          .to.user.klip.nfts[index]['place'],
                                      startDate: UserController.to.user.klip
                                          .nfts[index]['start_date'],
                                      endDate: UserController
                                          .to.user.klip.nfts[index]['end_date'],
                                      during: UserController
                                          .to.user.klip.nfts[index]['during'],
                                      qrData:
                                          UserController.to.qrDataList[index],
                                    ),
                                  );
                                })),
                onLoading: CircularProgressIndicator()))));
  }
}
