import 'package:enft/app/controller/klip.dart';
import 'package:enft/app/ui/loading_hud/loading_hud.dart';
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
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      title: Text("이용권 전송"),
      actions: [
        TextButton(
            // 이 부분에 sendTicket 함수 작성
            onPressed: () async => await KlipController.to.sendTicket(),
            child: Text(
              "완료",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }

  BottomAppBar buildBottomNavigationBar(BuildContext context) {
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
                  onPressed: () async {
                  //  KlipController.to.sendTicket()
                   print("ASDASD");
                   print(KlipController.to.sendToAddress);
                   print(UserController.to.user.klip.nfts);
                   print(UserController.to.user.klip.nftTokens);
                   if(controller.isTrueList.length == 0) {
                     Get.snackbar("안내","선택된 티켓이 없습니다.", snackPosition: SnackPosition.BOTTOM);
                     return;
                   }
                   int i = 0;
                   int succIdx = 0;
                   LoadingHud loadingHud = LoadingHud(context: context);

                   loadingHud.showHud();
                   await Future.doWhile(() async {
                      if(i == controller.isTrueList.length) return false;
                      final idx = controller.isTrueList[i];
                       final response = await UserController.to
                           .RequestAuth("POST", "/user/transferNFT", data: {
                         "to": KlipController.to.sendToAddress,
                         "nft": UserController.to.user.klip.nftTokens[idx],
                       });
                       print(response.body);
                       if(response.statusCode == 201) {
                         succIdx++;
                       }
                      i++;
                      return true;
                   });
                   if(succIdx > 0) {
                     Get.snackbar("안내","티켓 ${succIdx}개 전송 완료.", snackPosition: SnackPosition.BOTTOM);
                     UserController.to.refreshUser();
                   } else {
                     Get.snackbar("안내","티켓 전송 실패.", snackPosition: SnackPosition.BOTTOM);
                   }
                   loadingHud.hideHud();
                   // final response = await UserController.to
                   //     .RequestAuth("POST", "/user/transferNFT", data: {
                   //   "to": place,
                   //   "requestDay": klayInfo.month * 30,
                   // });

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
