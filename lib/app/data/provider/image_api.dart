import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImageApiNative {
  final ImagePicker _picker = ImagePicker();

  ImageApiNative();

  Future<XFile?> pickImgFromGallery() async => await _picker.pickImage(source: ImageSource.gallery);

  Future<XFile?> pickImgFromCamera() async => await _picker.pickImage(source: ImageSource.camera);

  Future<List<XFile>?> pickMultiImg() async => await _picker.pickMultiImage();
}
