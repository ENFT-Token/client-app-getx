import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/provider/klaytn_api.dart';
import 'package:enft/app/data/provider/klip_api.dart';

class KlipRepository {
  final KlipApiClient klipApiClient;
  final KlaytnApiClient klaytnApiClient;

  KlipRepository({required this.klipApiClient, required this.klaytnApiClient});

  initKlip() => Klip(
      address: "",
      balance: 0.0,
      nftTokens: <String>[],
      nfts: <Map<String, dynamic>>[]).obs;

  getKlip() async {
    // 실제 기기 테스트 때 사용
    await klipApiClient.createUriLaunch();
    int i = 0;
    String address = "";
    await Future.doWhile(() async {
      i++;
      await Future.delayed(const Duration(seconds: 3));
      final result = await klipApiClient.getKlipAddress();
      if (result['status'] == "success") {
        address = result['address'];
        return false;
      }
      if (i == 10) {
        return false;
      }
      return true;
    });
    // 애뮬레이터 테스트 때 사용하는 코드, 실제 기기 테스트 할 때는 이 줄 아래부터 주석처리
    // ios
    // var address = "0x1e30781a9cfe3322feef25ab41734f64b056e76f";

    // android
    // var address = "0xb438de8ac7be89f5f65dcd9d17a5029ee050edf7";
    // 실제 기기 테스트 때는 이 위까지 주석

    if (address != "") {
      double balance = await klaytnApiClient.getBalance(address);
      List<String> nftTokens = [];
      List<Map<String, dynamic>> nfts = [];

      return Klip.fromJson({
        'address': address,
        'balance': balance,
        'nftTokens': nftTokens,
        'nfts': nfts,
      }).obs;
    } else {
      return null;
    }
  }

  getBalance(String address) async => await klaytnApiClient.getBalance(address);

  waitPolling() async {
    bool status = false;
    int i = 0;
    await Future.doWhile(() async {
      i++;
      await Future.delayed(const Duration(seconds: 3));
      final result = await klipApiClient.getKlipPolling();
      print(i);
      print(result);
      if (result['status'] == "success") {
        status = true;
        return false;
      }
      else if (result['status'] == "canceled") {
        status = false;
        return false;
      }
      if (i == 10) {
        status = false;
        return false;
      }
      return true;
    });
    return status;
  }

  sendKlay(String to, String amount) async {
    await klipApiClient.sendKlay(to, amount);
    await klipApiClient.createUriLaunch();
    return await waitPolling();
  }


  // Klip 관련이면 lib/data/provider/klip_api.dart에 함수 작성
  // KAS 관련이면 lib/data/provider/klaytn_api.dart에 함수 작성
  // ApiClient에서는 단순 api 요청 이후 바로 response 돌려줌
  // 받게 된 응답은 이 repository class에서 전처리를 하고, controller에게 데이터를 보내줌
  // controller - repository - apiClient 로 data가 연결되어 있음
  // sendTicket() async => await klipApiClient.sendCard(contract, from, to, cardId);

  getKlayKRWPrice() async => await klipApiClient.getKlayKRWPriceFromBithumb();
}
