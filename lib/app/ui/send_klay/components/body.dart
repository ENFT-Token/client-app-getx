import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/klip.dart';

import 'package:enft/app/ui/send_klay/components/text_field_container.dart';

class SendKlayBody extends GetView<KlipController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFieldContainer(
              child: TextField(
            onChanged: (value) => controller.sendToAddress = value,
            onSubmitted: (value) => controller.sendToAddress = value,
            decoration: InputDecoration(
                counterText: '',
                hintText: "상대방 지갑 주소를 입력해주세요",
                border: InputBorder.none),
          )),
          TextFieldContainer(
              child: TextField(
            inputFormatters: [
              // 음수가 아닌 소수만 입력 가능
              // 앞이 0인 정수 불가
              FilteringTextInputFormatter.allow(
                  RegExp(r'^[0-9]+(\\.[0-9]{1,2})?$')),
            ],
            onChanged: (value) => controller.sendAmount = double.parse(value),
            onSubmitted: (value) => controller.sendAmount = double.parse(value),
            decoration: InputDecoration(
                counterText: '',
                hintText: "클레이튼 개수를 입력해주세요",
                border: InputBorder.none),
          ))
        ],
      ),
    );
  }
}
