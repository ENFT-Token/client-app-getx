import 'dart:io';

import 'package:get/get.dart';

import 'package:dbcrypt/dbcrypt.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/model/user.dart';

import 'package:enft/app/data/provider/register_api.dart';

class RegisterRepository {
  final RegisterApiClient apiClient;
  late User user;

  RegisterRepository({required this.apiClient}) {
    initUser();
  }

  initUser() => user = User(
      access_token: "",
      nickname: "",
      sex: "남자",
      profile: File(""),
      location: "",
      klip: Klip(
          address: "",
          balance: 0.0,
          nftTokens: <String>[],
          nfts: <Map<String, dynamic>>[]));

  register() async {
    final result = await apiClient.register(user.toJson());
    if (result['message'] == "이미 등록된 사용자입니다.")
      result['privateKey'] = await apiClient
          .alreadyAccount(user.klip.address)
          .then((value) => value['privateKey']);

    if (result['privateKey'] != "") {
      final Map<String, dynamic> data = {
        'address': user.klip.address,
        'privateKey': await bcrypt(result['privateKey']),
      };

      return data;
    } else
      return {};
  }

  String bcrypt(String privateKey) =>
      DBCrypt().hashpw(privateKey, DBCrypt().gensaltWithRounds(10));

  alreadyNickname(String nickname) async =>
      await apiClient.alreadyNickname(nickname);
}
