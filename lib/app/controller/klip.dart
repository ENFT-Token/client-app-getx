import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:intl/intl.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/model/klip_transaction.dart';
import 'package:enft/app/data/repository/klip.dart';

class KlipController extends GetxController {
  static KlipController get to => Get.find<KlipController>();
  final KlipRepository repository;

  KlipController({required this.repository});

  late Rx<Klip> _klip;
  RxDouble _klaytnPrice = 0.0.obs;
  RxList<KlipTransaction> _klipTransactionList =
      List<KlipTransaction>.empty(growable: true).obs;

  // sendKlay를 위한 변수
  // 상대방 주소
  RxString _sendToAddress = "".obs;

  // 보낼 클레이튼의 양
  RxDouble _sendAmount = 0.0.obs;
  RxDouble _sendFee = 0.0.obs;
  TextEditingController sendAmountController =
      TextEditingController(text: "0.00");

  // sendTicket을 위한 변수
  // 모든 checkBox의 isChecked를 담을 리스트
  late RxList<RxBool> _isCheckList;

  // True인 checkBox들의 index를 담을 리스트
  RxList<int> _isTrueList = List<int>.empty(growable: true).obs;

  get klip => this._klip.value;

  set klip(value) => this._klip.value = value;

  get klaytnPrice => this._klaytnPrice.value;

  set klaytnPrice(value) => this._klaytnPrice.value = value;

  get klipTransactionList => this._klipTransactionList.value;

  set klipTransactionList(value) => this._klipTransactionList.value = value;

  // sendKlay
  get sendToAddress => _sendToAddress.value;

  set sendToAddress(value) => _sendToAddress.value = value;

  get sendAmount => _sendAmount.value;

  set sendAmount(value) => _sendAmount.value = value;

  get sendFee => _sendFee.value;

  set sendFee(value) => _sendFee.value = value;

  // seendNFT
  get isCheckList => _isCheckList.value;

  get isTrueList => _isTrueList.value;

  set isTrueList(value) => _isTrueList.value = value;

  // async await가 필요한가?
  // 나중에 try - catch로 error 잡기
  initKlip() async => _klip = repository.initKlip();

  refreshKlip() => _klip.refresh();

  getAddress() async {
    this._klip = await repository.getKlip();
    this.klaytnPrice = await repository.getKlayKRWPrice();
  }

  getBalance(String address) async => await repository.getBalance(address);

  setBalance(String address) async {
    double balance = await repository.getBalance(address);
    UserController.to.user.klip.balance = balance;
    klip.balance = balance;
    print('setbalance');
    print(balance);
    print(klip.balance);
    UserController.to.refreshUser();
    _klip.refresh();
  }

  initCheckList() {
    _isCheckList = RxList<RxBool>.generate(
        UserController.to.user.klip.nfts.length, (index) => false.obs,
        growable: true);
  }

  addToTrueList(int index) {
    isTrueList.add(index);
    _isTrueList.refresh();
  }

  removeFromTrueList(int index) {
    isTrueList.remove(index);
    _isTrueList.refresh();
  }

  getHistory(String network, String kind, int size) async {
    print(klipTransactionList);
    if (klipTransactionList.isEmpty) {
      klipTransactionList =
          await repository.getHistory(network, klip.address, kind, size);
      print(await repository.getHistory(network, klip.address, kind, size));
    } else {
      final result =
          await repository.getHistory(network, klip.address, kind, size);
      result.forEach((resultElement) {
        var contain = klipTransactionList.where((listElement) =>
            listElement.transferType == resultElement.transferType &&
            listElement.transactionTime == resultElement.transactionTime);
        if (contain.isEmpty) klipTransactionList.add(resultElement);
      });
    }
    print(klipTransactionList);
    _klipTransactionList.value
        .sort((a, b) => b.transactionTime.compareTo(a.transactionTime));
    _klipTransactionList.refresh();
  }

  sendKlay(String targetAddress, double amount) async {
    if (targetAddress.length < 42) return false;
    try {
      return await repository.sendKlay(targetAddress, amount.toString());
    } catch (e) {
      print(e);
      return false;
    }
  }

  // sendTicket
  sendTicket() {}

  // repository에서 받아온 데이터를 기반으로, controll하는 코드 작성
  // sendTicket() async {
  //   await repository.sendTicket();
  // }

  String currencyFormat(int price) {
    final formatCurrency = NumberFormat.simpleCurrency(
        locale: "ko_KR", name: "", decimalDigits: 0);
    return formatCurrency.format(price);
  }

  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
            title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
            title: Text(title), content: Text(content), actions: actions));
  }
}
