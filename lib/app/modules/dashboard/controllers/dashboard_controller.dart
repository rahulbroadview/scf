import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/alert_dialogs/common_dialog_header.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/signup/views/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/common_text_button.dart';
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

  launch() {
    final Uri emailLaunchUri = Uri(
      scheme: '',
      path:
          'https://www.scfinvestmentgroup.com/apk_versions/uploads/SCF_v1.0.apk',
    );

    canLaunchUrl(Uri.parse('https://www.google.com'));
  }

  // _launchWhatsapp() async {
  //   var url = Uri.parse(
  //       "https://wa.me/?text=Hey buddy, try this super cool new app!");
  //   if (await launchUrl(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  versionList() async {
    print("-----final+++");
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
    if (finalData != null) {
      print("-----final++++$finalData");
      if (finalData['force_update'] == 'true') {
        print("=======");

        showDialog(
            context: Get.context!,
            barrierDismissible: false,
            barrierColor: ConstColor.textColor.withOpacity(0.2),
            builder: (context) {
              return CommonDialogHeader(
                title: "New Version",
                showCloseIcon: true,
                bgColor: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getSize(value: 63).h),
                      CommonText(
                        text:
                            'A new version of app is available please click on below link to download latest version of app.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: getSize(value: 66).h, bottom: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: getSize(value: 354).w,
                              height: getSize(value: 88).h,
                              child: CommonElevatedButton(
                                text: "Download".toUpperCase(),
                                onPressed: () {
                                  Get.back();
                                  launch();
                                },
                                textColor: ConstColor.newBackgroundColor,
                                bgColor: ConstColor.newBackgroundColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              width: getSize(value: 354).w,
                              height: getSize(value: 88).h,
                              child: CommonTextButton(
                                text: "No".toUpperCase(),
                                onPressed: () {
                                  Get.back();
                                },
                                textColor: ConstColor.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    }
    update();
  }
}
