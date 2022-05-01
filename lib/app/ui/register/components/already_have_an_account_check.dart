import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  const AlreadyHaveAnAccountCheck(
      {Key? key, required this.login, required this.onPressed})
      : super(key: key);

  final bool login;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "계정이 없으신가요?" : "이미 계졍이 있나요?",
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              login ? "회원가입" : "로그인",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
