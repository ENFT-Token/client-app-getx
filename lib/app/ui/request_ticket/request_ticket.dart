import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/user.dart';
import 'package:enft/app/controller/request_ticket.dart';

import 'package:enft/app/ui/request_ticket/components/body.dart';

import '../../controller/gym_explore.dart';

class RequestTicketPage extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<RequestTicketController>(tag: Get.arguments['tag']);
    String place = Get.arguments["tag"];
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[50],
      body: RequestTicketBody(),
      bottomNavigationBar: buildBottomNavigationBar(controller, place),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      title: Text("이용권 발급 요청"),
      actions: [],
    );
  }

  BottomAppBar buildBottomNavigationBar(
      RequestTicketController controller, String place) {
    return BottomAppBar(
        color: Colors.grey[50],
        elevation: 0,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "발급 요청 정보",
                              style: TextStyle(
                                color: kSystemGray,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.selectKlayInfo.month.toString() + " 달",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 8),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        (controller.selectKlayInfo.klay)
                                            .toStringAsFixed(2),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: kDefaultPadding / 4,
                                      ),
                                      Text("KLAY")
                                    ])),
                          ],
                        ))),
                // Expanded(
                //     child: Text(currencyFormat(postList[0].price),
                //         style: const TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 18))),
                OutlinedButton(
                  onPressed: () async {
                    bool isTransferable = (controller.selectKlayInfo.klay >
                            UserController.to.user.klip.balance)
                        ? false
                        : true;
                    if (isTransferable) {
                      KlayData klayInfo = controller.selectKlayInfo;
                      final response = await UserController.to
                          .RequestAuth("POST", "/user/approve", data: {
                        "requestPlace": place,
                        "requestDay": klayInfo.month * 30,
                      });
                      print(response.statusCode);
                      Map<String, dynamic> body = jsonDecode(response.body);
                      if (response.statusCode == 201) {
                        Get.back();
                      } else {
                        Get.snackbar('Fail', body["message"],
                            snackPosition: SnackPosition.TOP);
                      }
                    } else {
                      controller.openDialog("잔고 부족", "클레이가 충분하지 않습니다.", [
                        TextButton(
                            onPressed: () => Get.back(), child: Text("확인"))
                      ]);
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 2,
                        vertical: kDefaultPadding / 2)),
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "전송하기",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
