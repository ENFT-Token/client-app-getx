import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/repository/klip.dart';

class KlipController extends GetxController {
  final KlipRepository repository;

  KlipController({required this.repository});

  final _klip = Klip().obs;

  get klip => this._klip.value;

  set klip(value) => this._klip.value = value;

  // async await가 필요한가?
  getAddress() async {
    await repository.getAddress().then((data) {
      this.klip = data;
    });
  }
}
