import 'package:get/get.dart';

import 'package:enft/app/data/model/user.dart';
import 'package:enft/app/data/repository/user.dart';

class UserController extends GetxController {
  final UserRepository repository;

  UserController({required this.repository});

  late var _user = User().obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  initUser() => _user = repository.initUser();

}
