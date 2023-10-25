import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/them/const_color.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());
    return GetBuilder<DetailsController>(builder: (controller) {
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
                                text: 'Staff Details',
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
              controller.staffData == null
                  ? Center(
                      child: CommonText(text: 'No Data Found'),
                    )
                  : Expanded(
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

                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(20.r),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: 'Name',
                                                  fontSize: 12.sp,
                                                  fontColor:
                                                      ConstColor.greyTextColor,
                                                ),
                                                CommonText(
                                                  text:
                                                      "${controller.staffData!.firstName} ${controller.staffData!.lastName}",
                                                  fontSize: 14.sp,
                                                  fontColor:
                                                      ConstColor.blackColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: 'Phone Number',
                                                  fontSize: 12.sp,
                                                  fontColor:
                                                      ConstColor.greyTextColor,
                                                ),
                                                CommonText(
                                                  text: controller.staffData!
                                                          .mobileNo ??
                                                      '',
                                                  fontSize: 14.sp,
                                                  fontColor:
                                                      ConstColor.blackColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: 'Email Id',
                                                  fontSize: 12.sp,
                                                  fontColor:
                                                      ConstColor.greyTextColor,
                                                ),
                                                CommonText(
                                                  text: controller.staffData!
                                                          .userEmail ??
                                                      "",
                                                  fontSize: 14.sp,
                                                  fontColor:
                                                      ConstColor.blackColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: 'Date Of Birth',
                                                  fontSize: 12.sp,
                                                  fontColor:
                                                      ConstColor.greyTextColor,
                                                ),
                                                CommonText(
                                                  text: controller
                                                              .staffData!
                                                              .userProfile!
                                                              .birthdate !=
                                                          null
                                                      ? DateFormat('dd-MM-yyyy')
                                                          .format(DateTime
                                                              .parse(controller
                                                                  .staffData!
                                                                  .userProfile!
                                                                  .birthdate
                                                                  .toString()))
                                                      : "-",
                                                  fontSize: 14.sp,
                                                  fontColor:
                                                      ConstColor.blackColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: 'Address 1',
                                                  fontSize: 12.sp,
                                                  fontColor:
                                                      ConstColor.greyTextColor,
                                                ),
                                                CommonText(
                                                  text: controller
                                                          .staffData!
                                                          .userProfile!
                                                          .address1 ??
                                                      '',
                                                  fontSize: 14.sp,
                                                  fontColor:
                                                      ConstColor.blackColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: 'Address 2',
                                                  fontSize: 12.sp,
                                                  fontColor:
                                                      ConstColor.greyTextColor,
                                                ),
                                                CommonText(
                                                  text: controller
                                                          .staffData!
                                                          .userProfile!
                                                          .address2 ??
                                                      '',
                                                  fontSize: 14.sp,
                                                  fontColor:
                                                      ConstColor.blackColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           CommonText(
                                      //             text: 'Requirement',
                                      //             fontSize: 12.sp,
                                      //             fontColor:
                                      //                 ConstColor.greyTextColor,
                                      //           ),
                                      //           CommonText(
                                      //             text:
                                      //                 "Requirement for home loan",
                                      //             fontSize: 14.sp,
                                      //             fontColor:
                                      //                 ConstColor.blackColor,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           CommonText(
                                      //             text: 'Handle by Staff',
                                      //             fontSize: 12.sp,
                                      //             fontColor:
                                      //                 ConstColor.greyTextColor,
                                      //           ),
                                      //           CommonText(
                                      //             text: 'Staff-1',
                                      //             fontSize: 14.sp,
                                      //             fontColor:
                                      //                 ConstColor.blackColor,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     )
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                              // ListView.builder(
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   shrinkWrap: true,
                              //   itemCount: 1,
                              //   itemBuilder: (context, index) {
                              //     return Padding(
                              //       padding: EdgeInsets.only(bottom: 10.h),
                              //       child:
                              //     );
                              //   },
                              // ),
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
