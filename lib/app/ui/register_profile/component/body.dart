import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/register.dart';
import 'package:enft/app/controller/image.dart';

import 'package:enft/app/ui/register_profile/component/rounded_button.dart';
import 'package:enft/app/ui/register_profile/component/profile_button.dart';

class RegisterProfileBody extends GetView<ImageController> {
  const RegisterProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
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
                print(RegisterController.to.user.profile);
                Get.toNamed('location');
              })
        ]));
  }
}
