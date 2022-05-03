import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/location.dart';

class LocationList extends GetView<LocationController> {
  const LocationList({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          "근처 동네",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Stack(children: [
          Obx(() => controller.locationList.first == ''
              ? Container()
              : ListView(shrinkWrap: true, children: <Widget>[
                  for (var address in controller.locationList)
                    Column(
                      children: [
                        Row(
                          children: [
                            TextButton(
                                onPressed: onPressed,
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    // <-- had to set alignment
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      const EdgeInsets.all(
                                          0), // <-- had to set padding to 0
                                    ),
                                    minimumSize: MaterialStateProperty.all(Size(
                                        MediaQuery.of(context).size.width - 32,
                                        40))),
                                child: Text(address,
                                    style:
                                        const TextStyle(color: Colors.black))),
                          ],
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.2,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black45,
                        ),
                      ],
                    )
                ]))
        ])
      ],
    );
  }
}
