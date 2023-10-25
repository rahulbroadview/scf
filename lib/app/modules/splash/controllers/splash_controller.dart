import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/dashboard/views/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/views/login_view.dart';
import '../../signup/views/signup_view.dart';
import '../../staffDashboard/views/staffDashboard_view.dart';

class SplashController extends GetxController {
  var isShowSplash = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 3), () {
      if (prefs.getString('email') != null) {
        if (prefs.getString('userType') == 'staff') {
          Get.offAll(const StaffDashboardView());
        } else {
          Get.offAll(const DashboardView());
        }
      } else {
        Get.offAll(const SignupView());
      }
    });
  }

  void increment() => count.value++;
}
