import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/controller/user.dart';

import 'package:enft/app/ui/send_klay/components/body.dart';

class SendKlayPage extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[50],
      body: SendKlayBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "클레이 전송",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  BottomAppBar buildBottomNavigationBar() {
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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "전송 총액",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Obx(() => Text(
                                    (controller.sendAmount + controller.sendFee)
                                        .toStringAsFixed(2),
                                    style: TextStyle(fontSize: 20),
                                  )),
                              SizedBox(
                                width: kDefaultPadding / 4,
                              ),
                              Text("KLAY")
                            ])),
                    Text("전송 수수료 0.0 KLAY",
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                )),
                // Expanded(
                //     child: Text(currencyFormat(postList[0].price),
                //         style: const TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 18))),
                OutlinedButton(
                  onPressed: () async {
                    bool isTransferable = (controller.sendAmount == 0 ||
                            (controller.sendAmount + controller.sendFee) >
                                UserController.to.user.klip.balance)
                        ? false
                        : true;

                    if (isTransferable) {
                      print("전송 가능");
                      print(controller.sendToAddress);
                      print(controller.sendAmount);
                      final status = await controller.sendKlay(controller.sendToAddress, controller.sendAmount);
                      print('final ${status}');
                      if(status) { // succ
                        await KlipController.to.setBalance(UserController.to.user.klip.address);
                        Get.snackbar('Succ',"전송 성공", snackPosition: SnackPosition.BOTTOM);
                      }
                      else {
                        Get.snackbar('Fail',"전송 실패", snackPosition: SnackPosition.BOTTOM);
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
