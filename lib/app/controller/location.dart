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
}
