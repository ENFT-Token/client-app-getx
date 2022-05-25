import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:get/get.dart';

import 'package:enft/app/data/repository/location.dart';

class LocationController extends GetxController {
  final LocationRepository repository;

  LocationController({required this.repository});

  RxString _location = "".obs;
  RxList<String> _locationList = [''].obs;
  List<String> _locationSearchList = [];
  bool _isEqualLists = true;

  get location => this._location.value;

  set location(value) => this._location.value = value;

  get locationList => this._locationList.value;

  set locationList(value) => this._locationList.value = value;

  get isEqualLists => this._isEqualLists;

  set isEqualLists(value) => this._isEqualLists = value;

  getAroundLocation() async {
    locationList = _locationSearchList = await repository.getAroundLocation();
    print(locationList);
    print(_locationSearchList);

  }

  searchLocation(String value) {
    if (value == "") {
      locationList = _locationSearchList;
      isEqualLists = true;
      return;
    }
    List<String> tempList = [];
    for (var address in locationList) {
      if (address.contains(value) == true) tempList.add(address);
    }
    isEqualLists = false;
    locationList = tempList;
  }

  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
        title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
        title: Text(title), content: Text(content), actions: actions));
  }
}
