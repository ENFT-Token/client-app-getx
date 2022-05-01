import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/register.dart';

import 'package:enft/app/ui/register/components/rounded_check_duplicate_button.dart';
import 'package:enft/app/ui/register/components/rounded_register_button.dart';
import 'package:enft/app/ui/register/components/rounded_drop_down.dart';

class RegisterBody extends GetView<RegisterController> {
  RegisterBody({Key? key}) : super(key: key);

  String name = "";
  String nickname = "";

  void openDialog(String title, String content) => Get.dialog(AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('취소'),
            onPressed: () => Get.back(),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightLottie = size.width - kDefaultPadding * 2;
    final heightInputField = 50;
    final heightDropDown = 40;
    final heightButton = 64;
    final paddingFromTop = (size.height -
            (heightLottie + heightInputField + heightDropDown + heightButton)) /
        4;

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SingleChildScrollView(
                    // scroll disable
                    // physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: paddingFromTop),
                    Lottie.asset("assets/lottie/register.json"),
                    RoundedCheckDuplicateButton(
                        maxLength: 10,
                        hintText: "닉네임을 입력하세요",
                        onChanged: (value) => controller.user.nickname = value,
                        onSubmitted: (value) =>
                            controller.user.nickname = value,
                        onPressed: () {
                          if (controller.user.nickname.length < 2) {
                            openDialog('너무 짧은 닉네임', '닉네임은 2글자 이상이어야 합니다.');
                            return;
                          }

                          if (!controller.isAlreadyNickname) {
                            openDialog('중복되는 닉네임', '이미 존재하는 닉네임입니다.');
                            return;
                          }

                          controller.alreadyNickname();
                        }),
                    RoundedDropDown(values: ['남자', '여자']),
                    RoundedRegisterButton(
                      onPressed: () {
                        if (!controller.isAlreadyNickname) {
                          openDialog('중복체크', '닉네임 중복체크를 해주세요');
                          return;
                        }
                        // Get.to('/register_profile');
                      },
                      text: '회원가입',
                    ),
                  ],
                )))));
  }
}
