import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:enft/app/data/model/user.dart';

class RegisterApiClient {
  static final RegisterApiClient _instance = RegisterApiClient._internal();

  factory RegisterApiClient() => _instance;

  RegisterApiClient._internal() {
    print("KlipApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    final uri =
        Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/register");

    data['profile'] = await uploadProfile(data['profile']);
    final body = json.encode(data);
    print(body);
    final http.Response response =
        await http.post(uri, body: body, headers: headers);

    print(response);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);
    return responseBody;
  }

  Future<bool> alreadyNickname(String nickname) async {
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! +
        ":3000/user/nickname?nickname=${nickname}");
    final http.Response response = await http.get(uri, headers: headers);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    print(nickname);
    print(responseBody['usable']);
    return responseBody['usable'];
  }

  Future<Map<String, dynamic>> alreadyAccount(String address) async {
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! +
        ":3000/auth/user/alreadyAccount?address=$address");

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    return responseBody;
  }

  Future uploadProfile(File image) async {
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;
      dio.options.headers = {'Content-Type': 'application/json'};

      String fileName = image.path.split('/').last;
      Map<String, dynamic> data = {
        'images': await MultipartFile.fromFile(image.path,
            filename: fileName,
            contentType: MediaType("image", fileName.split('.').last))
      };

      var formData = FormData.fromMap(data);

      var response = await dio.post(
        dotenv.env['SERVER_ADDRESS']! + ":3000/user/upload_profile",
        data: formData,
      );

      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
