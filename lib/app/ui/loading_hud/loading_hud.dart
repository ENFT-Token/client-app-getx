import 'package:flutter/material.dart';

import 'package:enft/app/constant/constant.dart';

class LoadingHud {
  static LoadingHud? _singleton;

  late BuildContext context;
  bool isLoading = false;

  LoadingHud._internal({required this.context});

  factory LoadingHud({required BuildContext context}) {
    return _singleton ?? LoadingHud._internal(context: context);
  }

  void showHud() {
    isLoading = true;
    final size = MediaQuery.of(context).size;
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => GestureDetector(
          onTap: () {
            if (isLoading) hideHud();
          },
          child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor: Colors.black26,
                      valueColor: AlwaysStoppedAnimation(kPrimaryColor)),
                  SizedBox(height: 10),
                  Text('Loading',
                      style: TextStyle(color: kPrimaryColor, fontSize: 16))
                ],
              ))),
    );
  }

  void hideHud() {
    isLoading = false;
    Navigator.pop(context);
  }
}
