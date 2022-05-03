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

  get user => this._user.value;

  set user(value) => this._user.value = value;

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
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
