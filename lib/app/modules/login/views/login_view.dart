import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/login/views/forgot_passwor_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: controller.logformKey,
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
                                text: "Welcome Back",
                                fontSize: 18.r,
                                fontWeight: FontWeight.w600,
                                fontColor: ConstColor.textColor,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              CommonText(
                                text: "Sign in with your existing account.",
                                fontSize: 12.r,
                                fontWeight: FontWeight.w300,
                                fontColor: ConstColor.textColor,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              CommonTextFormField(
                                fillColor: Colors.white,
                                borderColor: Colors.white,
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "Email Id",
                                validator: (value) {
                                  const pattern =
                                      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                                      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                                      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                                      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                                      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                                      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                                      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                                  final regex = RegExp(pattern);

                                  if (value!.isEmpty) {
                                    return "Please enter email";
                                  } else if (!regex.hasMatch(value)) {
                                    return "Please enter valid email address";
                                  } else {
                                    return null;
                                  }
                                },
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 10),
                                  child: Image.asset(
                                    'assets/assets_svg/mail.png',
                                    height: 18.h,
                                    width: 18.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              CommonTextFormField(
                                fillColor: Colors.white,
                                borderColor: Colors.white,
                                obscureText: controller.showPassword,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.showPassword =
                                          !controller.showPassword;
                                      controller.update();
                                    },
                                    child: Icon(controller.showPassword
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
                                controller: controller.passwordController,
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
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(const ForgotPasswordView());
                                    },
                                    child: CommonText(
                                      text: 'Forgot Password?',
                                      fontSize: 14.sp,
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Center(
                                child: SizedBox(
                                    height: 50.h,
                                    width: 335.h,
                                    child: CommonElevatedButton(
                                        text: 'Sign in',
                                        onPressed: () {
                                          if (controller
                                              .logformKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            controller.loginApiCall();
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
