import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/request_ticket.dart';
import 'package:enft/app/ui/request_ticket/components/rounded_drop_down.dart';
import 'package:enft/app/ui/request_ticket/components/rounded_decimal_input_field.dart';

class RequestTicketBody extends GetView<RequestTicketController> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => RoundedDropDown(
              child: DropdownButton(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(29.0)),
                hint: Text("성별을 고르세요"),
                items: (controller.gymNames.map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ))).toList(),
                value: controller.selectGymName,
                onChanged: (value) {
                  controller.selectGymName = value;
                },
              ),
            )),
        Obx(() => RoundedDropDown(
                child: DropdownButton(
              elevation: 0,
              borderRadius: BorderRadius.all(Radius.circular(29.0)),
              hint: Text("성별을 고르세요"),
              items: controller.ticketTerms
                  .map<DropdownMenuItem<int>>((e) => DropdownMenuItem<int>(
                        child: Text(e.toString()),
                        value: e,
                      ))
                  .toList(),
              value: controller.selectTicketTerm,
              onChanged: (value) {
                controller.selectTicketTerm = value;
              },
            ))),
        RoundedDecimalInputField(
            hintText: "클레이(KLAY)를 입력하세요",
            onChanged: (value) {
              if (value.indexOf('.') != value.length && value.length > 0)
                controller.paymentKlay = double.parse(value);
            },
            onSubmitted: (value) {
              if (value.indexOf('.') != value.length && value.length > 0)
                controller.paymentKlay = double.parse(value);
            })
      ],
    ));
  }
}
