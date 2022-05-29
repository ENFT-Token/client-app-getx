import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:path/path.dart';

class PostApiClient {
  PostApiClient();

  writePost(
      Map<String, dynamic> data, List<File> images, String access_token) async {
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;
      dio.options.headers = {
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $access_token'
      };

      List files = [];
      await Future.forEach(images, (element) async {
        String fileName = (element as File).path.split('/').last;
        files.add(await MultipartFile.fromFile((element as File).path,
            filename: fileName,
            contentType: MediaType("image", fileName.split('.').last)));
      });

      data['images'] = files;
      var formData = FormData.fromMap(data);

      var response = await dio.post(
        dotenv.env['SERVER_ADDRESS']! + ":3000/board",
        data: formData,
      );

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future getPost() async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/board");

    final http.Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final responseBody =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      print(responseBody);

      return responseBody;
    }
  }
}
