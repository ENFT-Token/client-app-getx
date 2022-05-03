import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/register.dart';
import 'package:enft/app/controller/image.dart';

import 'package:enft/app/ui/register/components/rounded_button.dart';
import 'package:enft/app/ui/register_profile/component/profile_button.dart';

class RegisterProfileBody extends GetView<HomeController> {
  const RegisterProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          ProfileButton(),
          SizedBox(
            height: 16,
          ),
          RoundedButton(
              text: "프로필 등록하기",
              onPressed: () {
                RegisterController.to.user.profile = controller.img;
                Get.toNamed('location');
              })
        ])));
  }
}
