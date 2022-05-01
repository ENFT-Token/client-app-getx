import 'package:get/get.dart';

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
}
