import 'dart:convert';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:convert/convert.dart';

import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart' as http_auth;


// KAS: Klaytn Api Service
class KlaytnApiClient {
  final basicUri = 'https://node-api.klaytnapi.com/v1';
  final authHttp = http_auth.BasicAuthClient(
      dotenv.env['KAS_ACCESS_KEY_ID'] ?? "",
      dotenv.env['KAS_SECRET_ACCESS_KEY'] ?? "");
  final Map<String, String> headers = <String, String>{
    'Content-type': 'application/json'
  };
  final Map<String, String> xChainIdHeaders = <String, String>{
    // real net
    'x-chain-id': '8217',

    // test net
    //'x-chain-id': '1001',
    'Content-type': 'application/json'
  };
  // Get latest block number
  // response: {"jsonrpc": "2.0", "id":1, "result": "latest block number"}
  Future<String> getBlockNumber() async {
    Uri uri = Uri.parse(basicUri + '/klaytn');
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
    Uri uri = Uri.parse(basicUri + '/klaytn');
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
    if(responseBody['result'] == null) return 0.0;

    double PEB = 1000000000000000000; // KLAY PEB
    double balance = int.parse(responseBody['result'].substring(2), radix:16) / PEB;
    return balance;
  }

  // Look up user NFTs
  // input: NFT contract address and NFT ID
  // response: {"uri": NFT json, "owner": owner address}
  void LookUpNFT(String address, String id) async {
    Uri uri = Uri.parse(basicUri + '/metadata/nft/$address/$id');
    final http.Response response = await http.get(uri, headers: headers);
  }

  // Look up user NFTs from ENFT server
  // http://server/caver/myNFT?address
  void LookUpNFTFromENFT(String address, String id) async {
    Uri uri = Uri.parse('http://server_ip/caver/myNFT?$address');
    final http.Response response = await http.get(uri, headers: headers);
  }
}
