import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:enft/app/data/provider/image_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageRepository {
  final ImageApiClient apiClient;

  ImageRepository({required this.apiClient});

  pickImgFromGallery() async {
    final result = await apiClient
        .pickImgFromGallery()
        .then((value) => File(value?.path ?? ""));
    print(result);
    return result;
  }

  pickImgFromCamera() async => await apiClient
      .pickImgFromCamera()
      .then((value) => File(value?.path ?? ""));

  pickMultiImg() async {
    List<File> imgList = [];
    final pickedImages = await apiClient.pickMultiImg() ?? [];
    await Future.forEach(pickedImages, (XFile element) async {
      imgList.add(File(element.path));
    });

    return imgList;
  }

  pickOriginProfile() => "photos/basic-profile.jpg";

  // convert image to base64
  Future<String> imgToBase64(File img) async {
    Uint8List imgBytes = await img.readAsBytes(); // convert to bytes
    String base64String =
        base64.encode(imgBytes); //convert bytes to base64 string
    // print(base64String);
    return base64String;
  }

  Future<File> fileFromImageUrl(String imagePath) async {
    final response = await apiClient.fileFromImageUrl(imagePath);
    final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, 'imagetest.png'));

    file.writeAsBytesSync(response.bodyBytes);

    return file;
  }
}
