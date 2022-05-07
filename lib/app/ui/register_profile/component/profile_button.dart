import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/image.dart';
import 'package:enft/app/ui/register_profile/component/profile_bottom_sheet.dart';

class ProfileButton extends GetView<ImageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () async {
          ProfileBottomSheet().showProfileBottomSheet(
              context,
              controller.pickImgFromGallery,
              controller.pickImgFromCamera,
              controller.pickOriginProfile);
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Obx(() => Container(
                height: size.width * 0.5,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                    image: DecorationImage(
                        image: MemoryImage(base64Decode(controller.img)),
                        fit: BoxFit.cover)))),
            Positioned(
                child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.black54,
                size: 40,
              ),
            ))
          ],
        ));
  }
}
