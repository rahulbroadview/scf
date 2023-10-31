import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_manager/app/alert_dialogs/internal_server_dialog.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/signup/views/signup_view.dart';
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
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.myProfileUrl, data);
    if (finalData != null) {
      ProfileModel userData = ProfileModel.fromJson(finalData);
      if (userData.response != null) {
        profileDetails = userData.response!;
      }
    }
    update();
  }

  getExcel() async {
    EasyLoading.show();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id};
    print(jsonEncode(data));
    var dio = Dio();
    try {
      final response = await dio.post(
        UrlUtils.exportUser,
        data: data,
        options: Options(
            validateStatus: (_) => true,
            headers: {'Content-Type': 'application/json'}),
      );
      EasyLoading.dismiss();
      if (response.data['statuscode'] == 404) {
        Get.rawSnackbar(
            message: response.data['response'],
            backgroundColor: ConstColor.errorColor);
        // return null;
      } else if (response.data['statuscode'] == 200) {
        final responseJson = response.data;
        var tempDir = await getTemporaryDirectory();
        String fullPath = tempDir.path + "/scf.xlsx'";
        dio.download(responseJson, fullPath);
        return responseJson;
      } else if (response.data['statuscode'] == 400) {
        Get.rawSnackbar(
            message: response.data['response'],
            backgroundColor: ConstColor.errorColor);
        // print("1");
        // Get.dialog(barrierColor: ConstColor.color1E3F84.withOpacity(0.8), getLoginErrorDialogWidget(errormessage: response.data['response']));
      } else if (response.data['statuscode'] == 403) {
        // Get.dialog(
        //     barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
        // getLoginErrorDialogWidget(errorMessage: response.data));
      } else if (response.data['statuscode'] == 401) {
        prefs.clear();
        Get.rawSnackbar(
            message: response.data['response'],
            backgroundColor: ConstColor.errorColor);
        Get.offAll(const SignupView());
      } else if (response.data['statuscode'] == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget());
        return null;
      } else {
        // Get.dialog(
        //     barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
        //     getLoginErrorDialogWidget(errorMessage: response.data));
        return null;
      }
    } catch (exception) {
      EasyLoading.dismiss();
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
    // print(UrlUtils.exportUser);
    // var finalData =
    //     await APIServices.postWithDioForlogin(UrlUtils.exportUser, data);

    // if (finalData != null) {
    //   // ProfileModel userData = ProfileModel.fromJson(finalData);
    //   // if (userData.response != null) {
    //   //   profileDetails = userData.response!;
    //   // }
    // }
    update();
  }
}
