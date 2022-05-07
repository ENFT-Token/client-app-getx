import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import 'package:enft/app/controller/image.dart';

class ImgUploadBtn extends GetView<ImageController> {
  ImgUploadBtn({Key? key, required this.iconData}) : super(key: key);

  final IconData iconData;
  late final List<XFile>? pickedImages;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () async => await controller.pickMultiImg(),
      icon: Icon(iconData,
          color:
              Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.64)),
    );
  }
}
