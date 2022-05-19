import 'package:flutter/material.dart';

import 'package:enft/app/ui/ticket/components/qr_code.dart';

class BottomTicket extends StatelessWidget {
  const BottomTicket({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("전자출입\nQR 코드",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width*0.06,
                        fontWeight: FontWeight.bold)),
                Text("오늘도 안전한\n편리한 헬스장",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width*0.0375,
                    )),
              ],
            )),
            QrCode(data: data)
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }
}
