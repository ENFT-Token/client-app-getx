import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

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

  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
            title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
            title: Text(title), content: Text(content), actions: actions));
  }

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
                        onChanged: (value) => controller.user.content = value,
                        onSubmitted: (value) =>
                            controller.user.content = value,
                        onPressed: () {
                          if (controller.user.content.length < 2) {
                            openDialog('너무 짧은 닉네임', '닉네임은 2글자 이상이어야 합니다.', [
                              TextButton(
                                child: const Text('취소'),
                                onPressed: () => Get.back(),
                              )
                            ]);
                            return;
                          }

                          if (!controller.isAlreadyNickname) {
                            openDialog(
                              '중복되는 닉네임',
                              '이미 존재하는 닉네임입니다.',
                              [
                                TextButton(
                                  child: const Text('취소'),
                                  onPressed: () => Get.back(),
                                )
                              ],
                            );
                            return;
                          }

                          controller.alreadyNickname();
                        }),
                    RoundedDropDown(values: ['남자', '여자']),
                    RoundedRegisterButton(
                      onPressed: () {
                        // if (!controller.isAlreadyNickname) {
                        //   openDialog('중복체크', '닉네임 중복체크를 해주세요');
                        //   return;
                        // }
                        Get.toNamed('/register_profile');
                      },
                      text: '회원가입',
                    ),
                  ],
                )))));
  }
}
