import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import '../controllers/login_controller.dart';

class UpdatePAsswordView extends GetView<LoginController> {
  const UpdatePAsswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: controller.updatePasswordKey,
            child: SizedBox(
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
                                text: "Update Password",
                                fontSize: 18.r,
                                fontWeight: FontWeight.w600,
                                fontColor: ConstColor.textColor,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CommonTextFormField(
                                fillColor: Colors.white,
                                borderColor: Colors.white,
                                obscureText: controller.newPassword,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.newPassword =
                                          !controller.newPassword;
                                      controller.update();
                                    },
                                    child: Icon(controller.newPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                hintText: "Password",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: controller.newPasswordController,
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 10),
                                  child: Image.asset(
                                    'assets/assets_svg/padlock.png',
                                    height: 18.h,
                                    width: 18.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CommonTextFormField(
                                fillColor: Colors.white,
                                borderColor: Colors.white,
                                obscureText: controller.confirmPassword,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.confirmPassword =
                                          !controller.confirmPassword;
                                      controller.update();
                                    },
                                    child: Icon(controller.confirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                hintText: "Confirm Password",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please confirm password";
                                  } else if (controller
                                          .newPasswordController.text !=
                                      value.toString()) {
                                    return "Password didn't match.";
                                  } else {
                                    return null;
                                  }
                                },
                                controller:
                                    controller.confirmPasswordController,
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 10),
                                  child: Image.asset(
                                    'assets/assets_svg/padlock.png',
                                    height: 18.h,
                                    width: 18.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Center(
                                child: SizedBox(
                                    height: 50.h,
                                    width: 335.h,
                                    child: CommonElevatedButton(
                                        text: 'Update Password',
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          if (controller
                                              .updatePasswordKey.currentState!
                                              .validate()) {
                                            print("======");
                                            controller.updatePassword(
                                                context: context);
                                            // controller.loginApiCall();
                                            // Get.offAll(const DashboardView());
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
        ),
      );
    });
  }
}
