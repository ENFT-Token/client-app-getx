import 'dart:convert';

import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';

import 'package:enft/app/data/repository/user.dart';
import 'package:enft/app/data/repository/sqflite.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();
  final UserRepository userRepository;
  final SqfliteRepository sqfliteRepository;

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
  RxList<String> _qrDataList = [""].obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  get qrDataList => this._qrDataList.value;

  set qrDataList(value) => this._qrDataList.value = value;

  initUser() {
    userRepository.initUser();
    _user = userRepository.user.obs;
  }

  login(Klip klip) async {
    if (sqfliteRepository.api.db == null)
      await sqfliteRepository.api.init('enft.db', 'user');
    final loginData = await sqfliteRepository.getData('user');

    try {
      user = await userRepository.login(loginData[0], klip);
      generateQrDatas();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void generateQrDatas() {
    for (int i = 0; i < UserController.to.user.klip.nftTokens.length; i++) {
      final map = {
        'address': UserController.to.user.klip.address,
        'nftToken': UserController.to.user.klip.nftTokens[i]
      };

      qrDataList.add(json.encode(map));
    }
  }
}
