import 'package:flutter/material.dart';

import 'package:enft/app/ui/register_profile/component/rounded_button.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        text: "프로필 등록하기",
        onPressed: () async {
          // print(context.read<UserProvider>().login);
          // await context.read<UserProvider>().register(context).then((value) {
          //   print(context.read<UserProvider>().login);
          //   if (context.read<UserProvider>().login == true)
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (_) => HomePage(title: "")));
        });
  }
}
