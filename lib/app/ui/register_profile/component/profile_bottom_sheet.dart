import 'package:flutter/material.dart';


import 'package:enft/app/constant/constant.dart';

class ProfileBottomSheet {
  void showProfileBottomSheet(BuildContext context, Function() gallery,
      Function() camera, Function() originProfile) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: false,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            height: size.height * 0.45,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2),
                          child: Text(
                            "프로필 사진 설정",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 14),
                          ),
                        ),
                        Divider(
                          color: Colors.black45,
                        ),
                        TextButton(
                            onPressed: () {
                              gallery();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "앨범에서 사진 선택",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            )),
                        Divider(
                          color: Colors.black45,
                        ),
                        TextButton(
                            onPressed: () {
                              camera();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "카메라로 사진 촬영",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            )),
                        Divider(
                          color: Colors.black45,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding / 2),
                            child: TextButton(
                                onPressed: () {
                                  originProfile();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "기본 이미지로 변경",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ))),
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "취소",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}
