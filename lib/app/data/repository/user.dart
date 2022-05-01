import 'package:get/get.dart';

import 'package:enft/app/data/model/klip.dart';
import 'package:enft/app/data/model/user.dart';
import 'package:enft/app/data/provider/user_api.dart';

class UserRepository {
  final UserApiClient apiClient;

  UserRepository({required this.apiClient});

  initUser() => User(
      nickname: "",
      sex: "",
      klip: Klip(
          address: "",
          balance: 0,
          nftTokens: <String>[],
          nfts: <Map<String, dynamic>>[])).obs;
// getAll() {
//   return apiClient.getAll();
// }
//
// postAll() {
//   return apiClient.postAll();
// }
}
