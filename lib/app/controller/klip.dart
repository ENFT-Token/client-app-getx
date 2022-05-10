import 'package:get/get.dart';

import 'package:enft/app/data/repository/klip.dart';
import 'package:intl/intl.dart';

class KlipController extends GetxController {
  static KlipController get to => Get.find<KlipController>();
  final KlipRepository repository;

  KlipController({required this.repository});

  late var _klip;
  RxDouble _klaytnPrice = 0.0.obs;

  get klip => this._klip.value;

  set klip(value) => this._klip.value = value;

  get klaytnPrice => this._klaytnPrice.value;

  set klaytnPrice(value) => this._klaytnPrice.value = value;

  // async await가 필요한가?
  // 나중에 try - catch로 error 잡기
  getAddress() async {
    this._klip = await repository.getKlip();
    this.klaytnPrice = await repository.getKlayKRWPrice();
  }

  String currencyFormat(int price) {
    final formatCurrency =
    NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);
    return formatCurrency.format(price);
  }
}
