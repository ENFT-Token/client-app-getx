import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  const QrCode({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return InkWell(
        onTap: () {
          showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                return SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                        body: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Center(
                                child: QrImage(
                              data: data,
                              backgroundColor: Colors.white,
                              size: width * 0.8,
                            )))));
              });
        },
        child: QrImage(
          data: data,
          backgroundColor: Colors.white,
          size: width * 0.275,
        ));
  }
}
