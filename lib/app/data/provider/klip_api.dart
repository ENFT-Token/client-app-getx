import 'dart:io';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

// Klip App2App api for flutter
// 3 Steps: Prepare -> Request -> Result
class KlipApiClient {
  String _requestKey = "";
  String _address = "";
  static final KlipApiClient _instance = KlipApiClient._internal();

  factory KlipApiClient() => _instance;

  KlipApiClient._internal() {
    print("KlipApiClient was created");
  }

  final prepareUri = Uri.parse('https://a2a-api.klipwallet.com/v2/a2a/prepare');
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  String get getRequestKey => _requestKey;

  Future<void> initKlipApi() async {
    print("Curr Init Klip API Key: $_requestKey");
    await prepareRequestKey();
    await getKlayKRWPriceFromBithumb();
    print("Init Klip API Key: $_requestKey");
  }

  // Prepare api
  // Get request key for klip App2App api
  Future<void> prepareRequestKey() async {
    String body = jsonEncode(<String, dynamic>{
      'bapp': {'name': 'ENFT'},
      'callback': {
        'success': 'mybapp://klipwallet/success',
        'fail': 'mybapp://klipwallet/fail'
      },
      'type': 'auth'
    });

    final http.Response response =
        await http.post(prepareUri, body: body, headers: headers);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody['request_key'].toString());
    _requestKey = responseBody['request_key'].toString();
  }

  // Send klay to another user
  Future sendKlay(String from, String to, String amount) async {
    print(from);
    String body = jsonEncode(<String, dynamic>{
      'bapp': {'name': 'My BApp'},
      'type': 'send_klay',
      'transaction': {'from': to, 'to': from, 'amount': amount}
    });

    final http.Response response =
        await http.post(prepareUri, body: body, headers: headers);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    print(responseBody);

    return responseBody;
  }

  // Send NFT card to another user
  Future<String> sendCard(
      String contract, String from, String to, String cardId) async {
    String body = jsonEncode(<String, dynamic>{
      'transaction': {
        'contract': contract,
        'from': from,
        'to': to,
        'card_id': cardId
      }
    });

    final http.Response response =
        await http.post(prepareUri, body: body, headers: headers);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    print(responseBody);

    return 'success';
  }

  // Request api
  // if set deep link, back to BApp
  // Get user klip address(EOA) to BApp

  // android verification api
  Future<void> createIntent() async {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull(
            'kakaotalk://klipwallet/open?url=https://klipwallet.com/?target=/a2a?request_key=$_requestKey#Intent;scheme=kakaotalk;package=com.kakao.talk;end'),
        package: 'com.kakao.talk');
    await intent.launch();
  }

  // iOS verification api
  Future<void> createDeepLink() async {
    String uri =
        "kakaotalk://klipwallet/open?url=https://klipwallet.com/?target=/a2a?request_key=$_requestKey";
    if (await canLaunchUrl(Uri.parse(uri))) {
      print("Deeplink can launch.");
      await launchUrl(Uri.parse(uri));
    } else {
      print("Error: Deeplink can't launch.");
    }
  }

  Future<void> createUriLaunch() async {
    await KlipApiClient().initKlipApi();
    if (Platform.isAndroid) {
      await createIntent();
    } else {
      await createDeepLink();
    }
  }

  // Result api
  // Get user klip address
  // Status : completed, canceled, error, prepare, requested
  // 현재 클립으로 이동하면서 이걸 부르는데, 클립 연동이 되기 전에 이게 먼저 실행되어서 이상하게 됌.
  // 폴링으로 지속적으로 요청을 보낸다?
  // 백그라운드에 잇을때 폴링이 되나?
  // 만약에 클립 화면에서 1시간 있으면?
  // 1분으로 하자.

  Future<String> getKlipAddress() async {
    while(true) {
      if(_address != "") return _address;
      Uri uri = Uri.parse(
          'https://a2a-api.klipwallet.com/v2/a2a/result?request_key=$_requestKey');

      final http.Response response = await http.get(uri, headers: headers);
      final body = Map<String, dynamic>.from(json.decode(response.body));

      if (body['status'].toString() == 'completed') {
        final result = Map<String, String>.from(body['result']);
        print('Get user klip address: ' + result['klaytn_address'].toString());
        _address = result['klaytn_address'].toString();
        return result['klaytn_address'].toString();
      } else if (body['status'].toString() == 'canceled') {
        print('User cancel request');
        // return 'canceled';
      } else if (body['status'].toString() == 'error') {
        print('Error getting klip address');
        // return 'error';
      } else {
        print(body);
        print('Request in progress');
        // return 'progress';
      }
      sleep(const Duration(seconds:1));

    }
  }

  // Get klay price from bithumb api
  // https://www.bithumb.com/trade/order/KLAY_KRW
  Future<double> getKlayKRWPriceFromBithumb() async {
    Uri request = Uri.parse('https://api.bithumb.com/public/ticker/KLAY_KRW');

    final http.Response response = await http.get(
      request,
    );

    final body = Map<String, dynamic>.from(json.decode(response.body));

    print(body['data']['closing_price']);
    return double.parse(body['data']['closing_price']);
  }
}
