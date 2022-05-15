import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';

import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

class ImageApiClient {
  final ImagePicker _picker = ImagePicker();

  ImageApiClient();

  Future<XFile?> pickImgFromGallery() async => await _picker.pickImage(source: ImageSource.gallery);

  Future<XFile?> pickImgFromCamera() async => await _picker.pickImage(source: ImageSource.camera);

  Future<List<XFile>?> pickMultiImg() async => await _picker.pickMultiImage();
}
