import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import '../controllers/login_controller.dart';

class OtpView extends GetView<LoginController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: Get.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/assets_svg/logo1.png',
                    width: 170.h,
                    height: 147.h,
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                          ),
                        ],
                        color: ConstColor.newBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            CommonText(
                              text: "Verify Otp",
                              fontSize: 18.r,
                              fontWeight: FontWeight.w600,
                              fontColor: ConstColor.textColor,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            // CommonText(
                            //   text: "Sign in with your existing account.",
                            //   fontSize: 12.r,
                            //   fontWeight: FontWeight.w300,
                            //   fontColor: ConstColor.textColor,
                            // ),
                            SizedBox(
                              height: 20.h,
                            ),
                            OtpTextField(
                              textStyle: const TextStyle(color: Colors.black),
                              numberOfFields: 6,
                              borderColor: ConstColor.buttonColor,
                              showFieldAsBox: true,

                              onCodeChanged: (String code) {},
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                controller.verificationCode = verificationCode;
                                controller.verifyOtp();
                                controller.update();
                                // showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return AlertDialog(
                                //         title: Text("Verification Code"),
                                //         content: Text(
                                //             'Code entered is $verificationCode'),
                                //       );
                                //     });
                              }, // end onSubmit
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Center(
                              child: SizedBox(
                                  height: 50.h,
                                  width: 335.h,
                                  child: CommonElevatedButton(
                                      text: 'Verify Otp',
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (controller.verificationCode.length <
                                            6) {
                                          Get.rawSnackbar(
                                              message:
                                                  'Please enter valid otp.',
                                              backgroundColor:
                                                  ConstColor.errorColor);
                                        } else {
                                          controller.verifyOtp();
                                        }
                                      })),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
