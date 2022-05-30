import 'dart:async';
import 'dart:convert';

import 'package:enft/app/controller/klip.dart';
import 'package:get/get.dart';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'package:enft/app/data/repository/user.dart';
import 'package:enft/app/data/repository/sqflite.dart';
import 'package:enft/app/data/model/klip.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decode/jwt_decode.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();
  final UserRepository userRepository;
  final SqfliteRepository sqfliteRepository;
  String access_token = "";

  UserController(
      {required this.userRepository, required this.sqfliteRepository}) {
    initUser();
  }

  @override
  onInit() async {
    if (sqfliteRepository.api.db == null)
      await sqfliteRepository.api.init('enft.db', 'user');
  }

  late var _user;
  RxList<dynamic> _qrDataList = List.empty(growable: true).obs;
  RxBool _isUpdateNFT = false.obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  updateKlip(Klip newKlip) => _user.update((oldKlip) {
        oldKlip.klip = newKlip;
      });

  refreshUser() => _user.refresh();

  get qrDataList => this._qrDataList.value;

  set qrDataList(value) => this._qrDataList.value = value;

  get isUpdateNFT => _isUpdateNFT.value;

  set isUpdateNFT(value) => _isUpdateNFT.value = value;

  initUser() {
    userRepository.initUser();
    _user = userRepository.user.obs;
  }

  Future<http.Response> RequestAuth(String method, String url,
      {Map<String, dynamic>? data}) async {
    late final http.Response response;
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token'
    };
    if (method == "POST") {
      final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000" + url);
      if (data == null) {
        response = await http.post(uri, headers: headers);
      } else {
        final body = json.encode(data);
        response = await http.post(uri, headers: headers, body: body);
      }
    } else if (method == "GET") {
      Uri uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000" + url);

      if (data != null)
        uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000" + url)
            .replace(queryParameters: data);
      response = await http.get(uri, headers: headers);
    }
    return response;
  }

  login() async {
    if (sqfliteRepository.api.db == null)
      await sqfliteRepository.api.init('enft.db', 'user');
    final loginData = await sqfliteRepository.getData('user');
    try {
      user = await userRepository.login(loginData[0]);
      this.access_token = user.access_token;

      generateQrDatas();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  updateNFT() async {
    isUpdateNFT = true;
    final result = await userRepository.getNFT(user.klip.address);

    Klip temp = Klip.fromJson({
      'address': user.klip.address,
      'balance': user.klip.balance,
      'nftTokens': result['nftTokens'],
      'nfts': result['nfts']
    });
    updateKlip(temp);
    KlipController.to.klip = temp;

    isUpdateNFT = false;
  }

  // idx에 해당하는 QR의 남은 초 반환
  int getRemainQrData(int idx) {
    final jwtToken = qrDataList[idx];
    Map<String, dynamic> payload = Jwt.parseJwt(jwtToken);
    DateTime now = DateTime.now();
    DateTime expiredDate =
        DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
    int difference =
        int.parse(expiredDate.difference(now).inSeconds.toString());
    return difference;
  }

  // idx에 해당하는 qr 시간을 30초로 재갱신
  void refreshQrData(int idx) {
    final map = {
      'address': user.klip.address,
      'nftToken': user.klip.nftTokens[idx]
    };
    final jwt = JWT(map);
    String token =
        jwt.sign(SecretKey('ENFT'), expiresIn: Duration(seconds: 30));
    qrDataList[idx] = token;
    _qrDataList.refresh();
  }

  // 모든 데이터 QR 생성 (30초로 시작)
  void generateQrDatas() {
    qrDataList = [];
    for (int i = 0; i < user.klip.nftTokens.length; i++) {
      final map = {
        'address': user.klip.address,
        'nftToken': user.klip.nftTokens[i]
      };
      // Create a json web token
      final jwt = JWT(map);
      String token =
          jwt.sign(SecretKey('ENFT'), expiresIn: Duration(seconds: 30));
      print(token);
      qrDataList.add(token);
    }

    // getRemainQrData,refreshQrData 용 샘플 테스트 코드 - 개발 완료되면 지워야 함.
    // Timer(Duration(seconds: 10), () {
    //   print("0번째 티켓 남은 시간 : ${getRemainQrData(0)}");
    //   print("0번째 티켓 리프레쉬 합니다.");
    //   refreshQrData(0);
    //   print("0번째 티켓  남은 시간 : ${getRemainQrData(0)}");
    // });
  }
}
