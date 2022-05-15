import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/provider/klaytn_api.dart';
import 'package:enft/app/data/provider/klip_api.dart';

class KlipRepository {
  final KlipApiClient klipApiClient;
  final KlaytnApiClient klaytnApiClient;

  KlipRepository({required this.klipApiClient, required this.klaytnApiClient});

  getKlip() async {
    // 실제 기기 테스트 때 사용
    // await klipApiClient.createUriLaunch();
    // var address = await klipApiClient.getKlipAddress();

    // 애뮬레이터 테스트 때 사용하는 코드, 실제 기기 테스트 할 때는 이 줄 아래부터 주석처리
    // ios
    // var address = "0x1e30781a9cfe3322feef25ab41734f64b056e76f";

    // android
    var address = "0xb438de8ac7be89f5f65dcd9d17a5029ee050edf7";
    // 실제 기기 테스트 때는 이 위까지 주석

    var balance = double.parse(await klaytnApiClient.getBalance(address));
    List<String> nftTokens = [];
    List<Map<String, dynamic>> nfts = [];

    return Klip.fromJson({
      'address': address,
      'balance': balance,
      'nftTokens': nftTokens,
      'nfts': nfts,
    }).obs;
  }

  sendKlay(String from, String to, String amount) async =>
      await klipApiClient.sendKlay(from, to, amount);

  // Klip 관련이면 lib/data/provider/klip_api.dart에 함수 작성
  // KAS 관련이면 lib/data/provider/klaytn_api.dart에 함수 작성
  // ApiClient에서는 단순 api 요청 이후 바로 response 돌려줌
  // 받게 된 응답은 이 repository class에서 전처리를 하고, controller에게 데이터를 보내줌
  // controller - repository - apiClient 로 data가 연결되어 있음
  // sendTicket() async => await klipApiClient.sendCard(contract, from, to, cardId);

  getKlayKRWPrice() async => await klipApiClient.getKlayKRWPriceFromBithumb();
}
