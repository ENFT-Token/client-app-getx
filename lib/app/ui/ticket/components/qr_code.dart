import 'package:enft/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:enft/app/controller/ticket.dart';
import 'package:enft/app/controller/user.dart';

class QrCode extends GetView {
  const QrCode({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return InkWell(
        onTap: () {
          showGeneralDialog(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Container(
                        height: size.height,
                        child: InkWell(
                            onTap: () => Get.back(),
                            child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                  Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("남은 시간",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          SizedBox(
                                            width: kDefaultPadding,
                                          ),
                                          Text(
                                            TicketController.to
                                                .qrCodeRemainTime
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  Obx(() => QrImage(
                                        data:
                                            UserController.to.qrDataList[index],
                                        backgroundColor: Colors.white,
                                        size: width * 0.8,
                                      )),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  OutlinedButton(
                                      onPressed: () => UserController.to
                                          .refreshQrData(index),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kPrimaryColor)),
                                      child: Text(
                                        "새로 고침 하기",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ))
                                ])))));
              },
              context: context);
        },
        child: Obx(() => QrImage(
              data: UserController.to.qrDataList[index],
              backgroundColor: Colors.white,
              size: width * 0.275,
            )));
  }
}
