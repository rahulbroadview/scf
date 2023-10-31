import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/services/api_services.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../staffDashboard/views/staffDashboard_view.dart';

class SignupController extends GetxController {
  bool textField1 = false;
  bool textField2 = false;
  bool textField3 = false;
  int count = 0;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final logformKey = GlobalKey<FormState>();
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
    };
    print(jsonEncode(data));
    print(UrlUtils.loginApiUrl);
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
}
