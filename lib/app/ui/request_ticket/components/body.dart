import 'dart:convert';

import 'package:enft/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/request_ticket.dart';
import 'package:enft/app/ui/request_ticket/components/rounded_drop_down.dart';

import '../../../controller/gym_explore.dart';

class RequestTicketBody extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RequestTicketController>(tag: Get.arguments['tag']);
    String place = Get.arguments["tag"];

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(place),
        // Obx(() => RoundedDropDown(
        //       child: DropdownButton(
        //         elevation: 0,
        //         borderRadius: BorderRadius.all(Radius.circular(29.0)),
        //         items: (controller.gymNames.map<DropdownMenuItem<String>>(
        //             (e) => DropdownMenuItem<String>(
        //                   child: Text(e),
        //                   value: e,
        //                 ))).toList(),
        //         value: controller.selectGymName,
        //         onChanged: (value) {
        //           controller.selectGymName = value;
        //         },
        //       ),
        //     )),
        Obx(() => RoundedDropDown(
                child: DropdownButton(
              elevation: 0,
              borderRadius: BorderRadius.all(Radius.circular(29.0)),
              items: controller.klayInfoList
                  .map<DropdownMenuItem<KlayData>>((e) => DropdownMenuItem<KlayData>(
                        child: Text('${e.month}개월'),
                        value: e,
                      ))
                  .toList(),
              value: controller.selectKlayInfo,
              onChanged: (value) {
                controller.selectKlayInfo = value;
                print(controller.selectKlayInfo.month.toString());
                print(controller.selectKlayInfo.klay.toString());
              },
            ))),
        Obx(() => Text('${controller.selectKlayInfo.klay} KLAY')),
        ElevatedButton(
          onPressed: () async {
              KlayData klayInfo = controller.selectKlayInfo;
              print(place);
              final response =  await UserController.to.RequestAuth("POST", "/user/approve", data: {
                "requestPlace": place,
                "requestDay": klayInfo.month * 30,
              });
              print(response.statusCode);
              Map<String, dynamic> body = jsonDecode(response.body);
              if(response.statusCode == 201) {
                Get.toNamed("/home");
              }
              else {
                Get.snackbar('Fail',body["message"], snackPosition: SnackPosition.TOP);
              }
            },
          style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                // shape : 버튼의 모양을 디자인 하는 기능
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 0.0),
          child: Text("발급 요청"),
        ),
        // RoundedDecimalInputField(
        //     hintText: "클레이(KLAY)를 입력하세요",
        //     onChanged: (value) {
        //       if (value.indexOf('.') != value.length && value.length > 0)
        //         controller.paymentKlay = double.parse(value);
        //     },
        //     onSubmitted: (value) {
        //       if (value.indexOf('.') != value.length && value.length > 0)
        //         controller.paymentKlay = double.parse(value);
        //     })
      ],
    ));
  }
}
