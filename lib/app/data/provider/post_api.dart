import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class PostApiClient {
  PostApiClient();

  Future writePost(Map<String, dynamic> data, String access_token) async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token'
    };
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/board");
    final body = json.encode(data);

    print(body.length);
    final http.Response response =
        await http.post(uri, body: body, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print("writePost");
    print(responseBody);

    return responseBody;
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
