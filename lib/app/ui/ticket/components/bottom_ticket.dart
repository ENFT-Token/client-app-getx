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
          children: [QrCode(data: data)],
        ),
      ],
    );
  }
}
