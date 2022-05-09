import 'package:location/location.dart';

import 'package:enft/app/data/provider/location_api.dart';

class LocationRepository {
  final LocationApiClient apiClient;
  var location = Location();

  LocationRepository({required this.apiClient});

  getAroundLocation() async {
    LocationData _locationData;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    return await apiClient.getAroundLocation(5,
        _locationData.latitude.toString(), _locationData.longitude.toString());
  }
}
