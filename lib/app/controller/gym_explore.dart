import 'dart:convert';

import 'package:enft/app/controller/request_ticket.dart';
import 'package:enft/app/controller/user.dart';
import 'package:get/get.dart';

import '../data/provider/request_ticket_api.dart';
import '../data/provider/user_api.dart';

import 'package:http/http.dart' as http;

import '../data/repository/request_ticket.dart';
import '../ui/request_ticket/request_ticket.dart';

class KlayData {
  int month;
  double klay;
  KlayData({required this.month, required this.klay});
  factory KlayData.fromJson(Map<dynamic, dynamic> parsedJson) {
      return KlayData(
        month: parsedJson['month'],
        klay: double.parse(parsedJson['klay']),
    );
  }
}

class GymData {
  String place;
  String location;
  String address;
  String cover_img;
  List<KlayData> list;

  GymData({required this.place,required this.location,required this.address, required this.cover_img, required this.list});
  factory GymData.fromJson(Map<dynamic, dynamic> parsedJson) {
      return GymData(
      place: parsedJson['place'],
      address: parsedJson['address'],
      location: parsedJson['location'],
      cover_img: parsedJson['cover_img'],
      list: List<KlayData>.from(parsedJson['list'].map((model)=> KlayData.fromJson(model)))
      );
  }
}

class GymExploreController extends GetxController {
  static GymExploreController get to => Get.find<GymExploreController>();

  RxList<GymData> list = <GymData>[].obs;
  Future<bool> init() async {
    print("GYM 입성");
    http.Response response  =  await UserController.to.RequestAuth("GET",":3000/user/healthList");
    print(response.statusCode);
    if(response.statusCode == 200) {
      Iterable l  = json.decode(response.body);
      list = List<GymData>.from(l.map((model)=> GymData.fromJson(model))).obs;
    }
    return true;
  }

  ToRequestTicketPage(String tag, List<KlayData> klayInfo, GymData gymInfo) {
    Get.to(RequestTicketPage(), arguments: {'tag': tag},
        binding: BindingsBuilder(() {
          Get.put(
              RequestTicketController(
                  klayInfoList: klayInfo,
                  gymInfo: gymInfo,
                  repository: RequestTicketRepository(
                      requestTicketApi: RequestTicketApi())),
              tag: tag);
          final requestTicketController =
          Get.find<RequestTicketController>(tag: tag);
          requestTicketController.selectKlayInfo =
          requestTicketController.klayInfoList[0];
        }));
  }
    //
    // final result = await userApiClient.login(data);
    // var fromJson = <String, dynamic>{};
    //
    // fromJson['access_token'] = result['access_token'];
    //
    //
    // final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/user/myNFT");
    //
    // Map<String, String> headers = <String, String>{
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $access_token'
    // };
    //
    // final http.Response response = await http.get(uri, headers: headers);
    //
    // final responseBody = List<String>.from(json.decode(response.body));
    //
    // return responseBody;
    //


}