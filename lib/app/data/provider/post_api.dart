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
        'Content-Type': 'application/x-www-form-urlencoded',
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
    // // create multipart request
    // var request = new http.MultipartRequest("POST", uri);
    // request.headers.addAll(headers);
    // request.fields['title'] = data['title'];
    // request.fields['content'] = data['content'];
    // request.fields['cost'] = data['cost'];
    // request.fields['location'] = data['location'];
    //
    // await Future.forEach(images, (element) async {
    //   http.MultipartFile multipartFile =
    //       await http.MultipartFile.fromPath('images', (element as File).path);
    //   // add file to multipart
    //   request.files.add(multipartFile);
    // });
    // // images.forEach((element) async {
    // //   http.MultipartFile multipartFile =
    // //   await http.MultipartFile.fromPath('file', element.path);
    // //   // add file to multipart
    // //   request.files.add(multipartFile);
    // //   print(request.files);
    // // });
    //
    // print('hello');
    // print(request.files);
    // // send
    // http.Response response =
    //     await http.Response.fromStream(await request.send());
    // print("Result: ${response.statusCode}");
    // print("after send");
    // print(response.statusCode);
    //
    // // listen for response
    // // response.stream.transform(utf8.decoder).listen((value) {
    // //   print(value);
    // // });
    // // print("finish");
  }

  Future getPost() async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/board");

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print("getPost");
    print(responseBody);

    return responseBody;
  }
}
