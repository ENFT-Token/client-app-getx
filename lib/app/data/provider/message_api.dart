import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class MessageApiClient {
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  MessageApiClient();

  Future<List> getMessageList(String roomId) async {
    final splitRoomId = roomId.split(" ");
    final body = json.encode({
      'roomId1': splitRoomId[0],
      'roomId2': splitRoomId[1],
    });

    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/events");

    final http.Response response =
        await http.post(uri, body: body, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody['chat']);
    return responseBody['chat'];
  }
}
