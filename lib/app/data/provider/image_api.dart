import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

class ImageApiClient {
  final ImagePicker _picker = ImagePicker();

  ImageApiClient();

  Future<XFile?> pickImgFromGallery() async =>
      await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

  Future<XFile?> pickImgFromCamera() async =>
      await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

  Future<List<XFile>?> pickMultiImg() async => await _picker.pickMultiImage(imageQuality: 50);

  Future fileFromImageUrl(String imagePath) async {
    final url = Uri.parse(dotenv.env['SERVER_ADDRESS']!+ ":3000" + imagePath);
    final response = await http.get(url);
    return response;
  }
}
