import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/location.dart';

import '../../../controller/image.dart';
import '../../../controller/klip.dart';
import '../../../controller/register.dart';
import '../../../controller/user.dart';
import '../../../data/model/klip.dart';

class LocationList extends GetView<LocationController> {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          "근처 동네",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Stack(children: [
          Obx(() => controller.locationList.first == ''
              ? Container()
              : ListView(shrinkWrap: true, children: <Widget>[
                  for (int i = 0; i < controller.locationList.length; i++)
                    Column(
                      children: [
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.location =
                                      controller.locationList[i];
                                  if (UserController.to.user.nickname == "") {
                                    controller
                                        .openDialog("회원가입", "계속해서 진행하시겠습니까?", [
                                      TextButton(
                                        child: const Text('취소'),
                                        onPressed: () => Get.back(),
                                      ),
                                      TextButton(
                                          child: const Text('확인',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          onPressed: () async {
                                            RegisterController
                                                    .to.user.location =
                                                controller.locationList[i];
                                            RegisterController.to.user.profile =
                                                ImageController.to.img;
                                            if (await RegisterController.to
                                                    .register() ==
                                                true) {
                                              UserController.to.user =
                                                  RegisterController.to.user;
                                              final isLogin =
                                                  await UserController.to
                                                      .login();
                                              if (isLogin) {
                                                KlipController.to.klip =
                                                    Klip.fromJson(UserController
                                                        .to.user.klip
                                                        .toJson());
                                                await KlipController.to.getHistory("baobob", "nft", 10);
                                                await KlipController.to.getHistory("mainnet", "klay", 10);
                                                Get.offAllNamed('/home');
                                              } else {
                                                controller.openDialog(
                                                    "에러", "다시 시도해주세요.", [
                                                  TextButton(
                                                    child: const Text('확인'),
                                                    onPressed: () => Get.back(),
                                                  )
                                                ]);
                                              }
                                            } else {
                                              controller.openDialog(
                                                  "에러", "다시 시도해주세요.", [
                                                TextButton(
                                                  child: const Text('확인'),
                                                  onPressed: () => Get.back(),
                                                )
                                              ]);
                                            }
                                          })
                                    ]);
                                  } else {
                                    controller.openDialog(
                                        "현재 위치 변경", "계속해서 진행하시겠습니까?", [
                                      TextButton(
                                          onPressed: () => Get.back(),
                                          child: Text("취소")),
                                      TextButton(
                                          onPressed: () {
                                            UserController.to.user.location =
                                                controller.locationList[i];
                                            UserController.to.refreshUser();
                                            Get.back();
                                            Get.back();
                                          },
                                          child: Text(
                                            "변경",
                                            style: TextStyle(color: Colors.red),
                                          )),
                                    ]);
                                  }
                                },
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    // <-- had to set alignment
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      const EdgeInsets.all(
                                          0), // <-- had to set padding to 0
                                    ),
                                    minimumSize: MaterialStateProperty.all(Size(
                                        MediaQuery.of(context).size.width - 32,
                                        40))),
                                child: Text(controller.locationList[i],
                                    style:
                                        const TextStyle(color: Colors.black))),
                          ],
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.2,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black45,
                        ),
                      ],
                    )
                ]))
        ])
      ],
    );
  }
}
