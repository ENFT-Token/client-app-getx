import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class LocationApiClient {
  LocationApiClient();

  List<Map<String, String>> latLonMapWithSnailArray(
      int num, String latitude, String longitude) {
    List<Map<String, String>> latLonMap =
        List.generate(num * num, (_) => <String, String>{});
    double lat = double.parse(latitude);
    double lon = double.parse(longitude);

    int index = 0;
    int swift = 1; // +는 행열의 증가, -는 행과 열의 감소
    int col = 1, row = 0;

    latLonMap
        .add({'lat': lat.toStringAsFixed(5), 'lon': lon.toStringAsFixed(5)});
    //[2] 처리
    do {
      for (int i = 0; i < num; i++) {
        row += swift; // 열은 변화, 행은 고정
        lat += 0.005 * swift;
        latLonMap[index].addAll(
            {'lat': lat.toStringAsFixed(5), 'lon': lon.toStringAsFixed(5)});
        index = index + 1;
      }
      num -= 1;
      if (num > 0) {
        for (int i = 0; i < num; i++) {
          col += swift; // 열은 고정, 행은 변화
          lon += 0.01 * swift;
          latLonMap[index].addAll(
              {'lat': lat.toStringAsFixed(5), 'lon': lon.toStringAsFixed(5)});
          index = index + 1;
        }
        swift *= (-1); // 스위칭
      } else {
        break;
      }
    } while (true);

    return latLonMap;
  }

  Future<List> getAroundLocation(int num, String lat, String lon) async {
    List<String> address = [];
    List<Map<String, String>> gpsMap = latLonMapWithSnailArray(num, lat, lon);
    print(gpsMap);
    Map<String, String> headers = {
      "X-NCP-APIGW-API-KEY-ID": dotenv.env['NAVER_MAP_API_KEY_ID'] ?? "",
      "X-NCP-APIGW-API-KEY": dotenv.env['NAVER_MAP_API_KEY'] ?? ""
    };

    String temp = "";

    for (int i = 0; i < gpsMap.length; i++) {
      http.Response response = await http.get(
          Uri.parse(
              "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=127.11234,${gpsMap[i]['lat']}&sourcecrs=epsg:4326&output=json"),
          // "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=${gpsMap[i]['lon']},${gpsMap[i]['lat']}&sourcecrs=epsg:4326&output=json"),
          headers: headers);


      String jsonData = response.body;

      var status = jsonDecode(jsonData)["status"]["code"];

      var state = jsonDecode(jsonData)["results"][1]['region']['area1']['name'];
      var city = jsonDecode(jsonData)["results"][1]['region']['area2']['name'];
      var town = jsonDecode(jsonData)["results"][1]['region']['area3']['name'];

      temp = state + " " + city + " " + town;

      if (address.contains(temp) == true) {
        continue;
      } else {
        address.add(temp);
      }
    }

    return address;
  }
}
