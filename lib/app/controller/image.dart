import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;

import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';

import 'package:enft/app/data/repository/image.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find<ImageController>();
  final ImageRepository repository;

  ImageController({required this.repository});

  Rx<File> _img = File("").obs;

  List<dynamic> _imgList = List.empty(growable: true).obs;

  get img => _img.value;

  set img(value) => _img.value = value;

  get imgList => _imgList;

  set imgList(value) => _imgList = value;

  initImg() async =>
      img = (await getImageFileFromAssets("photos/basic-profile.jpg"));

  pickImgFromGallery() async => img = await repository.pickImgFromGallery();

  pickImgFromCamera() async => img = await repository.pickImgFromCamera();

  pickMultiImg() async => imgList = await repository.pickMultiImg();

  pickOriginProfile() async =>
      img = await getImageFileFromAssets(repository.pickOriginProfile());

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = await File('${(await getTemporaryDirectory()).path}/$path')
        .create(recursive: true);

    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<File> fileFromImageUrl(String imagePath) async =>
      await repository.fileFromImageUrl(imagePath);
}
