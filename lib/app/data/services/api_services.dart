import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/alert_dialogs/internal_server_dialog.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/login/views/login_view.dart';
import 'package:pay_day_manager/app/modules/signup/views/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIServices {
  //Post Method with dio no header
  static dynamic postMethodWithHeaderDio(
      {String? apiUrl,
      String? token,
      List? body,
      bool isShowLoader = true}) async {
    if (isShowLoader) {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
    }
    var dio = Dio();
    try {
      final response = await dio.post(
        apiUrl!,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
            "GratSync-RequestId": "b59979d2-b423-435c-8c43-49c716e9a6fe",
            "GratSync-Token": token.toString()
          },
        ),
      );
      if (isShowLoader) {
        EasyLoading.dismiss();
      }
      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 401) {
        return response.statusCode;
      } else if (response.statusCode == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget());
        return null;
      } else {
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
  }

  static dynamic postMethodWithHeaderDioMapDataUpdateCommision(
      {String? apiUrl,
      String? token,
      Map? body,
      bool isShowLoader = true}) async {
    if (isShowLoader) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }
    var dio = Dio();
    try {
      final response = await dio.post(
        apiUrl!,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
            "GratSync-RequestId": "b59979d2-b423-435c-8c43-49c716e9a6fe",
            "GratSync-Token": token.toString()
          },
        ),
      );
      if (isShowLoader) {
        EasyLoading.dismiss();
      }
      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        // final responseJson = response.data;
        // return responseJson;
        return response.statusCode;
      } else if (response.statusCode == 401) {
        return response.data;
      } else if (response.statusCode == 400) {
        return response.data;
      } else if (response.statusCode == 403) {
        return response.data;
      } else if (response.statusCode == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget());
        return null;
      } else {
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
  }

  static dynamic postMethodWithHeaderDioMapData(
      {String? apiUrl,
      String? token,
      Map? body,
      bool isShowLoader = true}) async {
    if (isShowLoader) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }
    var dio = Dio();
    try {
      final response = await dio.post(
        apiUrl!,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
            "GratSync-RequestId": "b59979d2-b423-435c-8c43-49c716e9a6fe",
            "GratSync-Token": token.toString()
          },
        ),
      );
      if (isShowLoader) {
        EasyLoading.dismiss();
      }
      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 401) {
        return response.statusCode;
      } else if (response.statusCode == 400) {
        return response.statusCode;
      } else if (response.statusCode == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget());
        return null;
      } else {
        return null;
      }
      // Get.rawSnackbar(message: response.statusMessage, backgroundColor: ConstColor.colorFF0000);
    } catch (exception) {
      EasyLoading.dismiss();
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

//put method api

  static dynamic putMethodWithHeaderDio({
    String? apiUrl,
    String? token,
    Map? body,
    String? requestId,
    bool isShowLoader = true,
  }) async {
    if (isShowLoader) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }

    var dio = Dio();
    try {
      final response = await dio.put(
        apiUrl!,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
            "GratSync-Token": token.toString(),
            'GratSync-RequestId': requestId
          },
        ),
      );
      if (isShowLoader) {
        EasyLoading.dismiss();
      }
      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 401) {
        return response.statusCode;
      } else if (response.statusCode == 400) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget(errorMsg: response.data));
      } else if (response.statusCode == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget(errorMsg: response.data));
        return null;
      } else {
        return null;
      }
    } catch (exception) {
      if (isShowLoader) {
        EasyLoading.dismiss();
      }
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic putCreatemangerWithHeaderDio(
      {String? apiUrl, String? token, Map? body}) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    var dio = Dio();
    try {
      final response = await dio.put(
        apiUrl!,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
            "GratSync-RequestId": "b59979d2-b423-435c-8c43-49c716e9a6fe",
            "GratSync-Token": token.toString()
          },
        ),
      );
      EasyLoading.dismiss();
      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 401) {
        return response.statusCode;
      } else if (response.statusCode == 400) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget(errorMsg: response.data));
      } else if (response.statusCode == 500) {
        return "null";
      } else {
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
  }

//get dio api
  static dynamic getMethodWithHeaderDio(
      {String? apiUrl,
      String? token,
      bool isShowLoader = true,
      Map<String, dynamic>? queryData,
      bool? headerChange}) async {
    if (isShowLoader) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }
    var dio = Dio();
    try {
      final response = await dio.get(
        apiUrl!,
        queryParameters: queryData,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "GratSync-Portal": headerChange == true ? "PDP" : "PDM",
            "GratSync-RequestId": "b59979d2-b423-435c-8c43-49c716e9a6fe",
            "GratSync-Token": token.toString()
          },
        ),
      );
      if (isShowLoader) {
        EasyLoading.dismiss();
      }

      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        if (response.data == null) {
          return response.data.toString();
        } else {
          return response.data;
        }
      } else if (response.statusCode == 401) {
        return response.statusCode;
      } else if (response.statusCode == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget());
        return null;
      } else {
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
  }

  static dynamic postWithDio(String url, var body) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    var dio = Dio();
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(validateStatus: (_) => true, headers: {
          'GratSync-Portal': 'PDM',
          'Content-Type': 'application/json'
        }),
      );
      EasyLoading.dismiss();
      if (response.statusCode == 403 && response.statusCode == 404) {
        return null;
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 400) {
        // Get.dialog(
        //     barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
        //     getLoginErrorDialogWidget(errorMessage: response.data));
      } else if (response.statusCode == 403) {
        // Get.dialog(
        //     barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
        //     getLoginErrorDialogWidget(errorMessage: response.data));
      } else if (response.statusCode == 500) {
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
  }

  static dynamic postWithDioForlogin(String url, var body) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dio = Dio();
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
            validateStatus: (_) => true,
            headers: {'Content-Type': 'application/json'}),
      );
      print(url);
      print("======response=====$response");
      EasyLoading.dismiss();
      if (response.data['statuscode'] == 404) {
        Get.rawSnackbar(
            message: response.data['response'],
            backgroundColor: ConstColor.errorColor);
        // return null;
      } else if (response.data['statuscode'] == 200) {
        final responseJson = response.data;
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
  }

  static dynamic postWithDioForloginWithoutSearch(String url, var body) async {
    // EasyLoading.show(maskType: EasyLoadingMaskType.black);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dio = Dio();
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
            validateStatus: (_) => true,
            headers: {'Content-Type': 'application/json'}),
      );
      print("-----$response");
      // EasyLoading.dismiss();
      if (response.data['statuscode'] == 404) {
        Get.rawSnackbar(
            message: response.data['response'],
            backgroundColor: ConstColor.errorColor);
        // return null;
      } else if (response.data['statuscode'] == 200) {
        final responseJson = response.data;
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
  }

  static dynamic postWithDioForScanner(String url, var body) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    var dio = Dio();
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(validateStatus: (_) => true, headers: {
          'GratSync-Portal': 'PDM',
          'Content-Type': 'application/json'
        }),
      );
      EasyLoading.dismiss();
      if (response.statusCode == 404) {
        return null;
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 400) {
        Get.rawSnackbar(
            message: response.data, backgroundColor: ConstColor.errorColor);
        return response.statusCode;
      } else if (response.statusCode == 403) {
        return response.statusCode;
      } else if (response.statusCode == 500) {
        final responseJson = response.data;
        return responseJson;
      } else {
        final responseJson = response.data;
        return responseJson;
      }
    } catch (exception) {
      EasyLoading.dismiss();
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic postMethodWithHeaderForForgotPassword(
      {String? apiUrl, String? token, Map? body}) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    var dio = Dio();
    try {
      final response = await dio.post(
        apiUrl!,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
            "GratSync-RequestId": "b59979d2-b423-435c-8c43-49c716e9a6fe",
            "GratSync-Token": token.toString()
          },
        ),
      );
      EasyLoading.dismiss();
      if (response.statusCode == 403 && response.statusCode == 404) {
      } else if (response.statusCode == 200) {
        final responseJson = response.data;
        return responseJson;
      } else if (response.statusCode == 401) {
        return response.statusCode;
      } else if (response.statusCode == 400) {
        return response.statusCode;
      } else if (response.statusCode == 500) {
        Get.dialog(
            barrierColor: ConstColor.color1E3F84.withOpacity(0.8),
            getInternalServerErrorDialogWidget());
        return null;
      } else {
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
  }
}
