import 'package:get/get.dart';

import 'package:enft/app/data/repository/klip.dart';

class KlipController extends GetxController {
  static KlipController get to => Get.find<KlipController>();
  final KlipRepository repository;

  KlipController({required this.repository});

  late var _klip;

  get klip => this._klip.value;

  set klip(value) => this._klip.value = value;

  // async await가 필요한가?
  // 나중에 try - catch로 error 잡기
  getAddress() async => await repository.getKlip().then((data) {
        this._klip = data;
      });
}
