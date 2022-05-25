import 'package:enft/app/controller/klip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:enft/app/ui/send_ticket/components/body.dart';

import '../../constant/constant.dart';
import '../../controller/user.dart';

class SendTicketPage extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[50],
      body: SendTicketBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      title: Text("이용권 전송"),
      // actions: [
      //   TextButton(
      //       // 이 부분에 sendTicket 함수 작성
      //       onPressed: () async => await KlipController.to.sendTicket(),
      //       child: Text(
      //         "완료",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ))
      // ],
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
                      "전송 총 개수",
                      style: TextStyle(
                        color: kSystemGray,
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
                                    controller.isTrueList.length.toString(),
                                    style: TextStyle(fontSize: 20),
                                  )),
                              SizedBox(
                                width: kDefaultPadding / 4,
                              ),
                              Text(" 개")
                            ])),
                    Text(
                      "전송 수수료는 없습니다",
                      style: TextStyle(
                        color: kSystemGray,
                        fontSize: 12,
                      ),
                    )
                  ],
                )),
                OutlinedButton(
                  onPressed: () {
                    // bool isTransferable = (controller.sendAmount == 0 ||
                    //     (controller.sendAmount + controller.sendFee) >
                    //         UserController.to.user.klip.balance)
                    //     ? false
                    //     : true;
                    // if (isTransferable) {
                    //   print("전송 가능");
                    // } else {
                    //   controller.openDialog("", "클레이가 충분하지 않습니다.", [
                    //     TextButton(
                    //         onPressed: () => Get.back(), child: Text("확인"))
                    //   ]);
                    // }
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
