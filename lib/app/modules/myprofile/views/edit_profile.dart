import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_formfield.dart';
import '../../../core/them/const_color.dart';
import '../controllers/myprofile_controller.dart';

class EditProfile extends GetView<MyprofileController> {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MyprofileController());
    return GetBuilder<MyprofileController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Form(
              key: controller.addcustomerKey,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.arrow_back_ios)),
                                  CommonText(
                                    text: 'Update Profile',
                                    fontSize: 16.r,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    color: ConstColor.searchBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          CommonTextFormField(
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "First Name",
                            controller: controller.firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter first name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Last Name",
                            controller: controller.lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter last name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            isReadOnly: true,
                            fillColor: Colors.grey.withOpacity(0.20),
                            borderColor: Colors.grey.withOpacity(0.20),
                            hintText: "Mobile Number",
                            controller: controller.phoneNumberController,
                            textInputFormatter: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter mobile number";
                              } else if (value.length < 10) {
                                return "Please enter valid mobile number";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            isReadOnly: true,
                            fillColor: Colors.grey.withOpacity(0.20),
                            borderColor: Colors.grey.withOpacity(0.20),
                            hintText: "Email Id",
                            controller: controller.emailController,
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
                                return null;
                              } else if (!regex.hasMatch(value)) {
                                return "Please enter valid email address";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Address 1",
                            maxLines: 3,
                            controller: controller.address1eController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter address";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Address 2",
                            maxLines: 3,
                            controller: controller.address2Controller,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: ConstColor.buttonColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.r),
                                              bottomLeft:
                                                  Radius.circular(8.r))),
                                      child: Center(
                                          child: CommonText(
                                              text:
                                                  controller.imageName ?? '')),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.imageUpload();
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: CommonText(
                                            text: "Upload",
                                            fontColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          // Container(
                          //   height: 50.h,
                          //   decoration: BoxDecoration(
                          //       color: ConstColor.buttonColor,
                          //       borderRadius: BorderRadius.circular(10.r)),
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //           flex: 8,
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 borderRadius: BorderRadius.only(
                          //                     topLeft: Radius.circular(8.r),
                          //                     bottomLeft:
                          //                         Radius.circular(8.r))),
                          //             child: Center(
                          //                 child: CommonText(
                          //                     text:
                          //                         controller.imageName ?? '')),
                          //           )),
                          //       Expanded(
                          //           flex: 4,
                          //           child: GestureDetector(
                          //             onTap: () {
                          //               controller.imageUpload();
                          //             },
                          //             child: Container(
                          //               color: Colors.transparent,
                          //               child: Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(left: 10),
                          //                 child: CommonText(
                          //                   text: "Upload",
                          //                   fontColor: Colors.white,
                          //                 ),
                          //               ),
                          //             ),
                          //           ))
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Birth Date",
                            isReadOnly: true,
                            onTap: () {
                              controller.selectDate(context);
                            },
                            controller: controller.birthController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter birth date";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: SizedBox(
                                height: 50.h,
                                width: 335.h,
                                child: CommonElevatedButton(
                                    text: 'Update Profile',
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (controller
                                          .addcustomerKey.currentState!
                                          .validate()) {
                                        controller.updateProfile();
                                        print("11111");
                                      }
                                    })),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
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
