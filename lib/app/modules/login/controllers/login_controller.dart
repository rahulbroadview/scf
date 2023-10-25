import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/app/modules/login/views/login_view.dart';
import 'package:pay_day_manager/app/modules/login/views/otp_view.dart';
import 'package:pay_day_manager/app/modules/login/views/update_password_view.dart';
import 'package:pay_day_manager/app/modules/staffDashboard/views/staffDashboard_view.dart';
import 'package:pay_day_manager/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/login_model.dart';
import '../../../config/url_utils.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../signup/views/signup_view.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final logformKey = GlobalKey<FormState>();
  final forgotPasswordKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final count = 0.obs;
  String mail = '';
  String verificationCode = '';
  bool showPassword = true;
  final updatePasswordKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool newPassword = true;
  bool confirmPassword = true;
  loginApiCall() async {
    final prefs = await SharedPreferences.getInstance();
    Map data = {
      "user_email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "device_token": fcmToken,
      "status": "true"
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.loginApiUrl, data);
    if (finalData != null) {
      LoginModel userData = LoginModel.fromJson(finalData);
      if (userData.response != null) {
        prefs.setString('email', userData.response![0].userEmail ?? '');
        prefs.setString('userType', userData.response![0].userType ?? '');
        prefs.setString('token', userData.response![0].token ?? '');
        prefs.setString('phone', userData.response![0].mobileNo ?? '');
        prefs.setString('firstName', userData.response![0].firstName ?? '');
        prefs.setString('lastName', userData.response![0].lastName ?? '');
        prefs.setString('id', userData.response![0].id.toString() ?? '');
      }
      emailController.clear();
      passwordController.clear();
      if (prefs.getString('userType') == 'staff') {
        Get.offAll(const StaffDashboardView());
      } else {
        Get.offAll(const DashboardView());
      }
      // Get.offAll(const DashboardView());
    }
  }

  forgotPasswordApi() async {
    final prefs = await SharedPreferences.getInstance();
    Map data = {
      "email_id": emailController.text.trim(),
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.forgotApiUrl, data);
    if (finalData != null) {
      mail = emailController.text.trim();
      emailController.clear();
      Get.rawSnackbar(
          message: finalData['response'],
          backgroundColor: ConstColor.color009846);
      Get.to(const OtpView());
    }
    update();
  }

  verifyOtp() async {
    Map data = {
      "email_id": mail,
      "otp": verificationCode,
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.otpVerifyUrl, data);
    if (finalData != null) {
      Get.rawSnackbar(
          message: finalData['response'],
          backgroundColor: ConstColor.color009846);
      Get.to(const UpdatePAsswordView());
    }
    update();
  }

  updatePassword({required BuildContext context}) async {
    Map data = {
      "email_id": mail,
      "new_password": newPasswordController.text.trim(),
      "confirm_password": confirmPasswordController.text.trim(),
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.verifyPassword, data);
    if (finalData != null) {
      Get.rawSnackbar(
          message: finalData['response'],
          backgroundColor: ConstColor.color009846);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignupView()),
          (route) => false);
    }
    update();
  }
}
