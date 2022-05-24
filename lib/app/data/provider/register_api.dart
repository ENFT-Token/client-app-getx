import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

import 'package:enft/app/data/model/user.dart';

class RegisterApiClient {
  static final RegisterApiClient _instance = RegisterApiClient._internal();

  factory RegisterApiClient() => _instance;

  RegisterApiClient._internal() {
    print("KlipApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    data.removeWhere((key, value) => key == "profile");

    final uri =
        Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/register");

    final body = json.encode(data);
    print(body);
    final http.Response response =
        await http.post(uri, body: body, headers: headers);

    print(response);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);
    return responseBody;
  }

  Future<bool> alreadyNickname(String nickname) async {
    final uri = Uri.parse(
        dotenv.env['SERVER_ADDRESS']! + ":3000/user/nickname?nickname=${nickname}");
    final http.Response response = await http.get(uri, headers: headers);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    print(nickname );
    print(responseBody['usable']);
    return responseBody['usable'];
  }

  Future<Map<String, dynamic>> alreadyAccount(String address) async {
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! +
        ":3000/auth/user/alreadyAccount?address=$address");

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));
    return responseBody;
  }
// Map<String, dynamic> userJson(Map<String, dynamic> responseBody) {
//   final userJson = {
//     'nickname': responseBody['status'],
//     'address': responseBody['address'],
//     'location': responseBody['location'],
//     'sex': responseBody['sex'],
//     'profile': "none",
//     'access_token': responseBody['access_token']
//     // 'profile': responseBody['profile']['data'][0],
//   };
//
//   print(userJson);
//   return userJson;
// }

// Future<void> bcrypt(BuildContext context, String privateKey) async {
//   final hashedPassword =
//       DBCrypt().hashpw(privateKey, DBCrypt().gensaltWithRounds(10));
//   final Map<String, dynamic> data = {
//     'address': registerJson['address'],
//     'privateKey': hashedPassword,
//   };
//
//   final userTable = await context.read<SqfliteProvider>().getData('user');
//   if (userTable.isEmpty != true) {
//     await context.read<SqfliteProvider>().delete();
//   }
//   await context.read<SqfliteProvider>().insert('user', data);
//   await fetchUser(await context.read<SqfliteProvider>().getData('user'));
// }

// Future<void> fetchUser(List<Map<String, dynamic>> maps) async {
//   print(maps);
//   if (maps.isEmpty) return;
//
//   final requestJson = {
//     'address': maps[0]['address'],
//     'privateKey': maps[0]['privateKey']
//   };
//   final uri =
//       Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/login");
//   final body = json.encode(requestJson);
//
//   final http.Response response =
//       await http.post(uri, body: body, headers: headers);
//
//   final responseBody = Map<String, dynamic>.from(json.decode(response.body));
//
//   print(responseBody);
//   if (responseBody['status'] != "success") return;
//
//   user = User.fromJson(userJson(responseBody));
//   await myNFT();
//   KlaytnApi klaytnApi = KlaytnApi();
//   user.wallet.balance =
//       double.parse(await klaytnApi.getBalance(user.wallet.address));
//   login = true;
//   print("AA");
//   print(user);
// }

// Future<void> alreadyAccount(BuildContext context) async {
//   final uri = Uri.parse(
//       dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/alreadyAccount");
//
//   Map<String, dynamic> bodyJson = {'address': registerJson['address']};
//   final body = json.encode(bodyJson);
//   print(body);
//   final http.Response response =
//       await http.post(uri, body: body, headers: headers);
//
//   print(response.body);
//   final responseBody = Map<String, dynamic>.from(json.decode(response.body));
//
//   if (responseBody['privateKey'] != "")
//     bcrypt(context, responseBody['privateKey']);
//   else
//     return;
// }

// Future<void> register(BuildContext context) async {
//   final uri =
//       Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/register");
//
//   registerJson['profile'] = "none";
//   final body = json.encode(registerJson);
//   print(body);
//   final http.Response response =
//       await http.post(uri, body: body, headers: headers);
//
//   print(response.body);
//   final responseBody = Map<String, dynamic>.from(json.decode(response.body));
//
//   print(responseBody);
//   if (responseBody['privateKey'] != "") {
//     await bcrypt(context, responseBody['privateKey']);
//   }
// }
//
// Future<void> myNFT() async {
//   final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/user/myNFT");
//
//   Map<String, String> temp = headers;
//   final token = user.access_token;
//   temp['Authorization'] = 'Bearer $token';
//
//   final http.Response response = await http.get(uri, headers: temp);
//
//   final responseBody = List<String>.from(json.decode(response.body));
//   if (responseBody.isEmpty == true) return;
//   List<Map<String, dynamic>> nfts = [];
//   int j = 0;
//   for (int i = 0; i < responseBody.length; i++) {
//     user.wallet.nftTokens.add(responseBody[i]);
//     nfts.add(Jwt.parseJwt(responseBody[i]));
//     calDuringTicket(nfts[i], responseBody[i]);
//   }
//   if (nfts.isEmpty) return;
//   user.wallet.nfts = nfts;
// }
//
// void calDuringTicket(Map<String, dynamic> data, String jwtToken) {
//   if (Jwt.isExpired(jwtToken) == true) {
//     data['during'] = "만료";
//     return;
//   }
//   DateTime _toDay = DateTime.now();
//
//   int difference = int.parse(_toDay
//       .difference(DateTime.parse(data['end_date'].replaceAll('-', '')))
//       .inDays
//       .toString());
//
//   if (_toDay.toString().substring(0, 10) == data['end_date'])
//     data['during'] = "D+0";
//   else
//     data['during'] = "D+" + ((difference - 1) * (-1)).toString();
// }
}
