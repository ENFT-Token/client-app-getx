import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/register.dart';

class RoundedDropDown extends GetView<RegisterController> {
  RoundedDropDown(
      {Key? key, required this.values, this.textColor = Colors.white})
      : super(key: key);

  final List values;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // total height = margin 20 + hint 20
    // if(context.read<UserProvider>().registerJson['sex'] == "") context.read<UserProvider>().registerJson['sex'] = "male";
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(29.0),
          border: Border.all(
              color: kPrimaryLightColor, style: BorderStyle.solid, width: 0.80),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Theme(
                data: ThemeData(
                  canvasColor: kPrimaryLightColor,
                  primaryColor: Colors.white,
                  // primaryColor: kPrimaryLightColor,
                ),
                child: // Your Dropdown Code Here,
                    DropdownButtonHideUnderline(
                        child: ButtonTheme(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  alignedDropdown: true,
                  child: Obx(() => DropdownButton(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(29.0)),
                        hint: Text("성별을 고르세요"),
                        items: values
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        value: controller.user.cost,
                        onChanged: (value) {
                          controller.user.cost = value;
                          print(controller.user.cost);
                        },
                      )),
                )))));
  }
}
