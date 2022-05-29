import 'dart:convert';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:convert/convert.dart';

import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart' as http_auth;
import 'package:intl/intl.dart';

// KAS: Klaytn Api Service
class KlaytnApiClient {
  final basicUri = 'https://node-api.klaytnapi.com';
  final authHttp = http_auth.BasicAuthClient(
      dotenv.env['KAS_ACCESS_KEY_ID'] ?? "",
      dotenv.env['KAS_SECRET_ACCESS_KEY'] ?? "");
  final Map<String, String> headers = <String, String>{
    'Content-type': 'application/json'
  };
  String contractAddress = "";
  final Map<String, String> xChainIdHeaders = <String, String>{
    // real net
    'x-chain-id': '8217',

    // test net
    //'x-chain-id': '1001',
    'Content-type': 'application/json'
  };

  final Map<String, String> xChainIdHeadersBaoBab = <String, String>{
    // test net
    'x-chain-id': '1001',
    'Content-type': 'application/json'
  };

  KlaytnApiClient() {
    init();
  }

  void init() async {
    this.contractAddress = await getContractAddress();

    // 테스트 코드
    // final nftHistory = await getHistory(
    //     "baobab", "0x24398567d110B862DB4ddA866deF160BC3C611d1", "nft", 10);
    // print("nftHistory ${nftHistory}");
    // final klayHistory = await getHistory(
    //     "mainnet", "0x24398567d110B862DB4ddA866deF160BC3C611d1", "klay", 10);
    // print("klayHistory ${klayHistory}");
  }

  /**
   * 스마트 컨트랙트 주소 가져오기
   */
  Future<String> getContractAddress() async {
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000"+ "/caver/contract");
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  /**
   * 서버에서 넘어오는 클레이튼 실제 클레이튼 개수로 변환
   */
  double calcHexKlayToDouble(String klayAmount) {
    double PEB = 1000000000000000000; // KLAY PEB
    double balance = int.parse(klayAmount.substring(2), radix: 16) / PEB;
    return balance;
  }

  String DateTimeToFormat(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(date);
    return formatted;
  }

  /**
   * 거래 내역 가져오기
   * @Argument network "mainnet" | "baobab"
   * @Argument kind "nft" | "klay"
   */
  Future<List<Map<String, dynamic>>> getHistory(
      String network, String address, String kind, int size) async {
    Map<String, dynamic> query = {};
    if (kind == "nft") {
      print(kind + " " + contractAddress);
      query = {
        'kind': kind,
        'ca-filter': contractAddress,
        'size': size.toString()
      };
    } else if (kind == "klay") {
      print(kind + " " + contractAddress);
      query = {'kind': kind, 'size': size.toString()};
    }

    print(query);
    Uri uri =
        Uri.parse("https://th-api.klaytnapi.com/v2/transfer/account/${address}")
            .replace(queryParameters: query);

    final http.Response response = (network == "mainnet")
        ? await authHttp.get(uri, headers: xChainIdHeaders)
        : await authHttp.get(uri, headers: xChainIdHeadersBaoBab);

    if (response.statusCode == 200) {
      final responseBody =
          List<Map<String, dynamic>>.from(json.decode(response.body)['items']);
      if (kind == "nft") {
        List<Map<String, dynamic>> nftDatas = responseBody.map((item) {
          DateTime time = DateTime.fromMillisecondsSinceEpoch(
              item['transaction']['timestamp'] * 1000);

          return {
            "transferType": item['transferType'],
            "from": item['from'],
            "to": item['to'],
            "time": DateTimeToFormat(time),
            "way": item['to'].toUpperCase() == address.toUpperCase()
                ? "deposit"
                : "withdraw",
          };
        }).toList();

        return nftDatas;
      } else if (kind == "klay") {
        List<Map<String, dynamic>> klayDatas = responseBody.map((item) {
          DateTime time =
              DateTime.fromMillisecondsSinceEpoch(item['timestamp'] * 1000);
          return {
            "transferType": item['transferType'],
            "from": item['from'],
            "to": item['to'],
            "value": calcHexKlayToDouble(item['value']),
            "fee": calcHexKlayToDouble(item['fee']),
            "status": item['status'],
            "way": item['to'].toUpperCase() == address.toUpperCase()
                ? "deposit"
                : "withdraw",
            "time": DateTimeToFormat(time),
          };
        }).toList();

        return klayDatas;
      }
    }

    return [];
  }

  // Get latest block number
  // response: {"jsonrpc": "2.0", "id":1, "result": "latest block number"}
  Future<String> getBlockNumber() async {
    Uri uri = Uri.parse(basicUri + '/v1/klaytn');
    String body = jsonEncode(<String, dynamic>{
      'jsonrpc': '2.0',
      'method': 'klay_blockNumber',
      'params': [],
      'id': 1
    });
    final http.Response response =
        await authHttp.post(uri, body: body, headers: xChainIdHeaders);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    return responseBody['result'];
  }

  // Get user wallet balance
  // input: userAddress, latest block number
  // response: {"jsonrpc": "2.0", "id":1, "result": Balance string, peb}
  Future<double> getBalance(String userAddress) async {
    Uri uri = Uri.parse(basicUri + '/v1/klaytn');
    String blockNumber = await getBlockNumber();
    String body = jsonEncode(<String, dynamic>{
      'jsonrpc': '2.0',
      'method': 'klay_getBalance',
      'params': [userAddress, "latest"],
      'id': 1
    });
    final http.Response response =
        await authHttp.post(uri, body: body, headers: xChainIdHeaders);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    print(responseBody['result']);
    print(responseBody['result'].runtimeType);
    if (responseBody['result'] == null) return 0.0;

    double PEB = 1000000000000000000; // KLAY PEB
    double balance =
        int.parse(responseBody['result'].substring(2), radix: 16) / PEB;
    return balance;
  }

  // Look up user NFTs
  // input: NFT contract address and NFT ID
  // response: {"uri": NFT json, "owner": owner address}
  void LookUpNFT(String address, String id) async {
    Uri uri = Uri.parse(basicUri + '/v1/metadata/nft/$address/$id');
    final http.Response response = await http.get(uri, headers: headers);
  }

  // Look up user NFTs from ENFT server
  // http://server/caver/myNFT?address
  void LookUpNFTFromENFT(String address, String id) async {
    Uri uri = Uri.parse('http://server_ip/caver/myNFT?$address');
    final http.Response response = await http.get(uri, headers: headers);
  }
}
