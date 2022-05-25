import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:get/get.dart';

import 'package:enft/app/controller/gym_explore.dart';
import 'package:enft/app/data/repository/request_ticket.dart';

class RequestTicketController extends GetxController {
  late final RequestTicketRepository repository;

  RequestTicketController({klayInfoList, gymInfo, required this.repository}) {
    this.klayInfoList = klayInfoList;
    this.gymInfo = gymInfo;
  }

  // 이 변수는 테스트용 변수입니다.
  List<String> _gymNames = [];

  // 이 변수들은 실제로 사용 될 변수입니다.
  RxString _selectGymName = "".obs;
  Rx<KlayData> _selectKlayInfo = KlayData(month: 0, klay: 0).obs;
  RxList<KlayData> _klayInfoList = List<KlayData>.empty(growable: true).obs;
  Rx<GymData> _gymInfo = GymData(place: "", location: "", address: "", cover_img: "", list: []).obs;
  RxDouble _paymentKlay = 0.0.obs;

  get gymNames => _gymNames;


  get gymInfo => _gymInfo.value;

  set gymInfo(value) => _gymInfo.value = value;


  get klayInfoList => _klayInfoList.value;

  set klayInfoList(value) => _klayInfoList.value = value;

  get selectGymName => _selectGymName.value;

  set selectGymName(value) => _selectGymName.value = value;

  get selectKlayInfo => _selectKlayInfo.value;

  set selectKlayInfo(value) => _selectKlayInfo.value = value;

  get paymentKlay => _paymentKlay.value;

  set paymentKlay(value) => _paymentKlay.value = value;

// 실제 사용할 함수입니다.
// getTicketTerms() {
//   _klayInfoList = repository.getTicketTerms();
//   selectKlayInfo = klayInfoList[0];
// }
//
// // 테스트용 함수입니다.
// getGymNames() {
//   _gymNames = repository.getGymNames();
//   selectGymName = gymNames[0];
// }
  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
        title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
        title: Text(title), content: Text(content), actions: actions));
  }
}
