import 'package:jwt_decode/jwt_decode.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/model/user.dart';
import 'package:enft/app/data/provider/user_api.dart';

class UserRepository {
  final UserApiClient userApiClient;

  late User user;

  UserRepository({required this.userApiClient});

  initUser() => user = User(
      access_token: "",
      nickname: "",
      sex: "남자",
      profile: "",
      location: "",
      klip: Klip(
          address: "",
          balance: 0.0,
          nftTokens: <String>[],
          nfts: <Map<String, dynamic>>[]));

  login(Map<String, dynamic> data, Klip klip) async {
    final result = await userApiClient.login(data);
    var fromJson = <String, dynamic>{};

    fromJson['access_token'] = result['access_token'];
    fromJson['nickname'] = result['nickname'];
    fromJson['location'] = result['location'];
    fromJson['sex'] = result['sex'];

    if (result['profile']['data'].isEmpty) {
      fromJson['profile'] = "";
    } else {
      fromJson['profile'] = result['profile']['data'][0];
    }

    final nftResult = await getNFT(result['access_token']);
    klip.nftTokens = nftResult['nftTokens'];
    klip.nfts = nftResult['nfts'];
    fromJson['klip'] = klip.toJson();

    user = User.fromJson(fromJson);

    return user;
  }

  getNFT(String access_token) async {
    final result = await userApiClient.getNFT(access_token);
    List<String> nftTokens = [];
    List<Map<String, dynamic>> nfts = [];
    int j = 0;
    for (int i = 0; i < result.length; i++) {
      nftTokens.add(result[i]);
      nfts.add(Jwt.parseJwt(result[i]));
      calDuringTicket(nfts[i], result[i]);
    }

    return {'nftTokens': nftTokens, 'nfts': nfts};
  }

  void calDuringTicket(Map<String, dynamic> data, String jwtToken) {
    if (Jwt.isExpired(jwtToken) == true) {
      data['during'] = "만료";
      return;
    }
    DateTime _toDay = DateTime.now();

    int difference = int.parse(_toDay
        .difference(DateTime.parse(data['end_date'].replaceAll('-', '')))
        .inDays
        .toString());

    if (_toDay.toString().substring(0, 10) == data['end_date'])
      data['during'] = "D-day";
    else
      data['during'] = "D-" + ((difference - 1) * (-1)).toString();
  }
}
