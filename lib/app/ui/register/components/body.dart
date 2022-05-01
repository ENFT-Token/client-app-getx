import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/ui/register/components/rounded_button.dart';
import 'package:enft/app/ui/register/components/rounded_drop_down.dart';
import 'package:enft/app/ui/register/components/rounded_input_field.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({Key? key}) : super(key: key);

  String name = "";
  String nickname = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightLottie = size.width - kDefaultPadding * 2;
    final heightInputField = 50;
    final heightDropDown = 40;
    final heightButton = 64;
    final paddingFromTop = (size.height - (heightLottie + heightInputField + heightDropDown + heightButton)) / 4;

    return SafeArea(
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
                RoundedInputField(
                  hintText: "닉네임을 입력하세요",
                  onChanged: (value) {
                    //   nickname = value;
                    //   context.read<UserProvider>().registerJson['nickname'] =
                    //       value;
                    //   print(nickname);
                    // },
                    // onSubmitted: (value) {
                    //   context.read<UserProvider>().registerJson['nickname'] =
                    //       value;
                    //   print(
                    //       context.read<UserProvider>().registerJson['nickname']);
                  },
                  onSubmitted: (String value) {},
                ),
                RoundedDropDown(values: ['남자', '여자']),
                RoundedButton(
                  onPressed: () {
                    // if (context.read<UserProvider>().registerJson['nickname'] == "" || context.read<UserProvider>().registerJson['sex'] == "") return;
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) => RegisterProfilePage()));
                  },
                  text: '회원가입',
                ),

              ],
            ))));
  }
}
