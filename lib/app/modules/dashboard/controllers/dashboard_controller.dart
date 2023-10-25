import 'package:get/get.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/modules/signup/views/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/services/api_services.dart';

class DashboardController extends GetxController {
  logoutFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(const SignupView());
  }

  @override
  void onInit() {
    super.onInit();
    versionList();
  }

  versionList() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "version": "1.0",
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.checkVersion, data);
    if (finalData != null) {}
    update();
  }
}
