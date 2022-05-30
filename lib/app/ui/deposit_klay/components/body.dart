import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/user.dart';

import 'package:enft/app/ui/deposit_klay/components/text_field_with_title.dart';

class DepositKlayBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
            child: Column(
          children: [
            QrImage(
              data: UserController.to.user.klip.address,
              backgroundColor: Colors.white,
              size: size.width * 0.6,
            ),
            TextFieldWithTitle(
                title: Text(
                  "지갑 주소",
                  style: TextStyle(
                    color: kSystemGray,
                    fontSize: 16,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding / 2),
                    child: Row(
                      children: [
                        Expanded(
                            child: Obx(
                          () => Text(UserController.to.user.klip.address,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        )),
                        IconButton(
                            onPressed: () => Clipboard.setData(ClipboardData(
                                text: UserController.to.user.klip.address)),
                            icon: Icon(Icons.copy_rounded))
                      ],
                    ))),
            TextFieldWithTitle(
                title: Text(
                  "현재 잔고",
                  style: TextStyle(
                    color: kSystemGray,
                    fontSize: 16,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding * 1.25),
                    child: Row(
                      children: [
                        Expanded(
                            child: Obx(() => Text(
                                  UserController.to.user.klip.balance
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ))),
                        Text(
                          "KLAY",
                          style: TextStyle(
                            color: kSystemGray,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ))),
            Text(
              "* ENFT가 지원하는 KLAY 코인과 NFT만 보내고 받을 수 있습니다.",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 16,
              ),
            )
          ],
        )));
  }
}
