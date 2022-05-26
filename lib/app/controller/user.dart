import 'dart:convert';

import 'package:get/get.dart';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:enft/app/data/repository/user.dart';
import 'package:enft/app/data/repository/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();
  final UserRepository userRepository;
  final SqfliteRepository sqfliteRepository;
  String access_token = "";

  UserController(
      {required this.userRepository, required this.sqfliteRepository}) {
    initUser();
  }

  @override
  onInit() async {
    if (sqfliteRepository.api.db == null)
      await sqfliteRepository.api.init('enft.db', 'user');
  }

  late var _user;
  List<dynamic> _qrDataList = List.empty(growable: true).obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  refreshUser() => _user.refresh();

  get qrDataList => this._qrDataList;

  set qrDataList(value) => this._qrDataList = value;

  initUser() {
    userRepository.initUser();
    _user = userRepository.user.obs;
  }

  Future<http.Response> RequestAuth(String method, String url,
      {Map<String, dynamic>? data}) async {
    late final http.Response response;
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token'
    };
    if (method == "POST") {
      final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + url);
      if (data == null) {
        response = await http.post(uri, headers: headers);
      } else {
        final body = json.encode(data);
        response = await http.post(uri, headers: headers, body: body);
      }
    } else if (method == "GET") {
      Uri uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + url);
      ;
      if (data != null)
        uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + url)
            .replace(queryParameters: data);
      response = await http.get(uri, headers: headers);
    }
    return response;
  }

  login() async {
    if (sqfliteRepository.api.db == null)
      await sqfliteRepository.api.init('enft.db', 'user');
    final loginData = await sqfliteRepository.getData('user');
    try {
      user = await userRepository.login(loginData[0]);
      this.access_token = user.access_token;

      generateQrDatas();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void generateQrDatas() {
    for (int i = 0; i < user.klip.nftTokens.length; i++) {
      final map = {
        'address': user.klip.address,
        'nftToken': user.klip.nftTokens[i]
      };
      // Create a json web token
      final jwt = JWT(map);
      String token = jwt.sign(SecretKey('ENFT'),expiresIn: Duration(seconds: 30));
      print(token);
      qrDataList.add(token);
    }
  }
}
