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
    final user1 = splitRoomId[0];
    final user2 = splitRoomId[1];

    final uri =
        Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/events/$user1/$user2");

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    if(responseBody['chat'] == null) return [];
    print(responseBody['chat']);
    return responseBody['chat'];
  }
}
