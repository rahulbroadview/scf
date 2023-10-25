import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/adminfilelisting/views/adminfile_view.dart';
import 'package:pay_day_manager/app/modules/customerlisting/views/customerlisting_view.dart';
import 'package:pay_day_manager/app/modules/myprofile/views/myprofile_view.dart';
import '../../../alert_dialogs/common_dialog_header.dart';
import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_button.dart';
import '../../../core/constant/common_method.dart';
import '../../../core/them/const_color.dart';
import '../../addsettings/views/addSetting_view.dart';
import '../../customerlisting/controllers/customerlisting_controller.dart';
import '../../staaflist/views/staaflist_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (controller) {
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
                              CommonText(
                                text: 'Dashboard',
                                fontSize: 16.r,
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    barrierColor:
                                        ConstColor.textColor.withOpacity(0.2),
                                    builder: (context) {
                                      return CommonDialogHeader(
                                        title: "Confirmation",
                                        bgColor: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: getSize(value: 50).w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: getSize(value: 63).h),
                                              CommonText(
                                                text:
                                                    'Are you sure you want to logout?',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: getSize(value: 66).h,
                                                    bottom: 30.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          getSize(value: 354).w,
                                                      height:
                                                          getSize(value: 88).h,
                                                      child:
                                                          CommonElevatedButton(
                                                        text:
                                                            "Yes".toUpperCase(),
                                                        onPressed: () {
                                                          Get.back();
                                                          controller
                                                              .logoutFunction();
                                                        },
                                                        textColor: ConstColor
                                                            .newBackgroundColor,
                                                        bgColor: ConstColor
                                                            .newBackgroundColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          getSize(value: 354).w,
                                                      height:
                                                          getSize(value: 88).h,
                                                      child: CommonTextButton(
                                                        text:
                                                            "No".toUpperCase(),
                                                        onPressed: () {
                                                          Get.back();
                                                          Get.back();
                                                        },
                                                        textColor: ConstColor
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                              },
                              child: const Icon(Icons.logout))
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            'assets/assets_svg/curve.png',
                            height: 270.h,
                            width: Get.width,
                            fit: BoxFit.fitWidth,
                            // color: Colors.red,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 30.w),
                            child: Image.asset(
                              'assets/assets_svg/dashboard.png',
                              height: 189.h,
                              width: 171.h,
                              // color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const StaaflistView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ConstColor.singleBackground,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Image.asset(
                                          'assets/assets_svg/single_person.png',
                                          height: 40.h,
                                          width: 40.h,
                                        ),
                                        CommonText(
                                          text: 'Staff',
                                          fontColor: ConstColor.textColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  var con =
                                      Get.put(CustomerlistingController());
                                  con.customerFilterList = null;
                                  con.searchController.clear();
                                  con.update();
                                  Get.to(const CustomerlistingView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ConstColor.multipleBackground,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Image.asset(
                                          'assets/assets_svg/multiple_person.png',
                                          height: 40.h,
                                          width: 40.h,
                                        ),
                                        CommonText(
                                          text: 'Customer',
                                          fontColor:
                                              ConstColor.customerTextColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const AddSettingView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ConstColor.settingBackground,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Image.asset(
                                          'assets/assets_svg/setting.png',
                                          height: 40.h,
                                          width: 40.h,
                                        ),
                                        CommonText(
                                          text: 'Setting',
                                          fontColor:
                                              ConstColor.settingTextColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const MyprofileView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ConstColor.profileBackground,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Image.asset(
                                          'assets/assets_svg/mdi_user-tie.png',
                                          height: 40.h,
                                          width: 40.h,
                                        ),
                                        CommonText(
                                          text: 'My Profile',
                                          fontColor:
                                              ConstColor.profileTextColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const AdminFileListView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ConstColor.singleBackground,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Icon(
                                          Icons.file_copy,
                                          size: 35.h,
                                          color: ConstColor.textColor,
                                        ),
                                        CommonText(
                                          text: 'Files',
                                          fontColor: ConstColor.textColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const Expanded(flex: 6, child: SizedBox()),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CommonText(
                            text: 'Version  1.0.0',
                            fontColor: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                    ],
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
