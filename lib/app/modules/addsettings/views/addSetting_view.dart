import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/addloancategory/views/addloancategory_view.dart';
import 'package:pay_day_manager/app/modules/addloanfiles/views/addloanfiles_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/them/const_color.dart';
import '../controllers/addSetting_controller.dart';

class AddSettingView extends GetView<AddSettingController> {
  const AddSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AddSettingController());
    return GetBuilder<AddSettingController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Column(
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
                                text: 'Add Setting',
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
              Expanded(
                child: Container(
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
                        GestureDetector(
                          onTap: () {
                            Get.to(const AddLoanCategoryView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.getExcel();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: ConstColor
                                              .profileBackgroundColor),
                                      child: Center(
                                        child: Image.asset(
                                            "assets/assets_svg/file.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    CommonText(text: "Export"),
                                  ],
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          thickness: 1.h,
                          color: Colors.grey.withOpacity(0.4),
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const AddLoanCategoryView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color:
                                            ConstColor.profileBackgroundColor),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/assets_svg/file.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  CommonText(text: "Add Loan Category"),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          thickness: 1.h,
                          color: Colors.grey.withOpacity(0.4),
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const AddLoanFilesView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color:
                                            ConstColor.profileBackgroundColor),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/assets_svg/file.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  CommonText(text: "Add Loan Documents"),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          thickness: 1.h,
                          color: Colors.grey.withOpacity(0.4),
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse("https://wa.me/?text=https://www.scfinvestmentgroup.com/apk_versions/uploads/SCF_v1.1.apk");
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch');
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color:
                                            ConstColor.profileBackgroundColor),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/assets_svg/file.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  CommonText(text: "Share App"),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          thickness: 1.h,
                          color: Colors.grey.withOpacity(0.4),
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
