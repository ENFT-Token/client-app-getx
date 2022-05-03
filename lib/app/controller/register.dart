import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:enft/app/data/model/user.dart';
import 'package:enft/app/data/repository/register.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository;

  RegisterController({required this.repository}) {
    initUser();
  }

  late var _user;
  RxBool _isAlreadyNickname = false.obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  get isAlreadyNickname => this._isAlreadyNickname.value;

  set isAlreadyNickname(value) => this._isAlreadyNickname.value = value;

  initUser() => this._user = repository.initUser();

  alreadyNickname() async =>
      isAlreadyNickname = await repository.alreadyNickname(_user.value.nickname);

  Future<void> register() async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    final uri =
    Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/register");

    // registerJson['profile'] = "none";
    final body = json.encode(user.toJson());
    print(body);
    final http.Response response =
    await http.post(uri, body: body, headers: headers);

    print(response.body);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);
    // if (responseBody['privateKey'] != "") {
    //   await bcrypt(context, responseBody['privateKey']);
    // }
  }

}
