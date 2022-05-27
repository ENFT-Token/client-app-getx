import 'package:flutter/material.dart';

class TransactionTitleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            VerticalDivider(
              thickness: 2.5,
              color: Colors.blue,
            ),
            Expanded(
                child: Text(
                  "최근 거래내역",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Icon(Icons.more_vert_rounded)
          ],
        ));
  }
}