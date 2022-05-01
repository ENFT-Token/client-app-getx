import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/model/user.dart';
import 'package:enft/app/data/provider/register_api.dart';

class RegisterRepository {
  final RegisterApiClient apiClient;

  RegisterRepository({required this.apiClient});

  initUser() => User(
      nickname: "",
      sex: "남자",
      klip: Klip(
          address: "",
          balance: 0.0,
          nftTokens: <String>[],
          nfts: <Map<String, dynamic>>[])).obs;

  alreadyNickname(String nickname) async => await apiClient.alreadyNickname(nickname);
// getAll() {
//   return apiClient.getAll();
// }
//
// postAll() {
//   return apiClient.postAll();
// }
}
