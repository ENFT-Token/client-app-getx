import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:enft/app/data/provider/image_api.dart';

class ImageRepository {
  final ImageApiNative apiNative;

  ImageRepository({required this.apiNative});

  pickImgFromGallery() async => await apiNative
      .pickImgFromGallery()
      .then((value) async => await imgToBase64(File(value?.path ?? "")));

  pickImgFromCamera() async => await apiNative
      .pickImgFromCamera()
      .then((value) async => await imgToBase64(File(value?.path ?? "")));

  pickMultiImg() async {
    List<String> imgList = [];
    final pickedImages = await apiNative.pickMultiImg() ?? [];
    await Future.forEach(pickedImages, (XFile element) async {
      imgList.add(await imgToBase64(File(element.path)));
    });

    return imgList;
  }

  pickOriginProfile() async {
    final originImg = "assets/photos/basic-profile.jpg";
    ByteData bytes = await rootBundle.load(originImg);
    var buffer = bytes.buffer;
    final img = base64.encode(Uint8List.view(buffer));
    return img;
  }

  // convert image to base64
  Future<String> imgToBase64(File img) async {
    Uint8List imgBytes = await img.readAsBytes(); // convert to bytes
    String base64String =
        base64.encode(imgBytes); //convert bytes to base64 string
    // print(base64String);
    return base64String;
  }
}
