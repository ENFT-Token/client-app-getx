import 'package:get/get.dart';

import 'package:enft/app/data/repository/register.dart';
import 'package:enft/app/data/repository/sqflite.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  final RegisterRepository registerRepository;
  final SqfliteRepository sqfliteRepository;

  RegisterController(
      {required this.registerRepository, required this.sqfliteRepository}) {
    initUser();
  }

  @override
  onInit() async {
    if (sqfliteRepository.api.db == null)
      await sqfliteRepository.api.init('enft.db', 'user');
  }

  late var _user;
  RxBool _isAlreadyNickname = false.obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  get isAlreadyNickname => this._isAlreadyNickname.value;

  set isAlreadyNickname(value) => this._isAlreadyNickname.value = value;

  initUser() => _user = registerRepository.user.obs;

  alreadyNickname() async => isAlreadyNickname =
      await registerRepository.alreadyNickname(_user.value.nickname);

  Future<bool> register() async {
    registerRepository.user = user;
    print(registerRepository.user.klip.address);
    final result = await registerRepository.register();
    if (result.isEmpty)
      return false;
    else {
      final userTable = await sqfliteRepository.getData('user');
      if (userTable.isEmpty) {
        await sqfliteRepository.insert('user', result);
      } else {
        await sqfliteRepository.update('user', result);
      }
      return true;
    }
  }
}
