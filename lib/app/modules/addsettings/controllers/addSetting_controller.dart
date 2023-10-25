import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/profile_list_model.dart';
import '../../../config/url_utils.dart';
import '../../../data/services/api_services.dart';

class AddSettingController extends GetxController {
  final count = 0.obs;
  List<ProfileResponse> profileDetails = [];
  @override
  void onInit() {
    super.onInit();
    // getProfile();
  }

  getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "staff_id": id, "login_id": id};
    print(jsonEncode(data));
    print(UrlUtils.myProfileUrl);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.myProfileUrl, data);
    print("========");
    print(finalData);
    if (finalData != null) {
      ProfileModel userData = ProfileModel.fromJson(finalData);
      if (userData.response != null) {
        profileDetails = userData.response!;
      }
    }
    update();
  }
}
