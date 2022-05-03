import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/provider/klaytn_api.dart';
import 'package:enft/app/data/provider/klip_api.dart';

class KlipRepository {
  final KlipApiClient klipApiClient;
  final KlaytnApiClient klaytnApiClient;

  KlipRepository({required this.klipApiClient, required this.klaytnApiClient});

  getKlip() async {
    // await klipApiClient.createUriLaunch();
    // String status = "";
    // int i = 0;
    // while (i < 10) {
    //   await Future.delayed(const Duration(seconds: 5));
    //   status = await klipApiClient.getKlipAddress();
    //   if (status == "progress") {
    //     i++;
    //   } else if (status == "") {
    //     print("error");
    //     break;
    //   } else {
    //     address = status;
    //     break;
    //   }
    // }
    var address = "0xb438de8ac7be89f5f65dcd9d17a5029ee050edf7";
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
}