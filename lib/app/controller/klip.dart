import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/repository/klip.dart';

import 'package:enft/app/ui/loading_hud/loading_hud.dart';

class UserController extends GetxController {
  final KlipRepository repository;

  UserController({required this.repository});

  final _klip = Klip().obs;

  get klip => this._klip.value;

  set klip(value) => this._klip.value = value;

  // async await가 필요한가?
  // 나중에 try - catch로 error 잡기
  getAddress(BuildContext context) async {
    final loadingHud = LoadingHud(context: context);
    loadingHud.showHud();
    await repository.getAddress().then((data) {
      this.klip = data;
    });
    loadingHud.hideHud();
    Get.toNamed('register');
  }
}