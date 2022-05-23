import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GymExploreController extends GetxController {
  @override
  void onInit() {
    Get.put(
        GymExploreController(),
        permanent: true);
    print("GYM 입성");

    //
    // final result = await userApiClient.login(data);
    // var fromJson = <String, dynamic>{};
    //
    // fromJson['access_token'] = result['access_token'];
    //
    //
    // final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/user/myNFT");
    //
    // Map<String, String> headers = <String, String>{
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $access_token'
    // };
    //
    // final http.Response response = await http.get(uri, headers: headers);
    //
    // final responseBody = List<String>.from(json.decode(response.body));
    //
    // return responseBody;
    //

    super.onInit();
  }
}