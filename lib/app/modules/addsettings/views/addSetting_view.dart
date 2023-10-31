import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/addloancategory/views/addloancategory_view.dart';
import 'package:pay_day_manager/app/modules/addloanfiles/views/addloanfiles_view.dart';

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
                        // controller.profileDetails.isEmpty
                        //     ? const SizedBox()
                        //     : ListView.builder(
                        //         physics: const NeverScrollableScrollPhysics(),
                        //         shrinkWrap: true,
                        //         itemCount: controller.profileDetails.length,
                        //         itemBuilder: (context, index) {
                        //           return Padding(
                        //             padding: EdgeInsets.only(bottom: 10.h),
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(20.r),
                        //                   color: ConstColor.textColor),
                        //               child: Padding(
                        //                 padding: EdgeInsets.all(20.r),
                        //                 child: Column(
                        //                   children: [
                        //                     Center(
                        //                       child: CircleAvatar(
                        //                         radius: 25.r,
                        //                         backgroundColor: Colors.white,
                        //                         child: Image.asset(
                        //                           'assets/assets_svg/profile.png',
                        //                           height: 50.h,
                        //                           width: 50.h,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 10.h,
                        //                     ),
                        //                     Center(
                        //                       child: CommonText(
                        //                         text:
                        //                             '${controller.profileDetails[index].firstName} ${controller.profileDetails[index].lastName}',
                        //                         fontSize: 16.sp,
                        //                         fontColor: Colors.white,
                        //                         fontWeight: FontWeight.w500,
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 5.h,
                        //                     ),
                        //                     Center(
                        //                       child: CommonText(
                        //                         text: controller
                        //                                 .profileDetails[index]
                        //                                 .userType ??
                        //                             '',
                        //                         fontSize: 12.sp,
                        //                         fontColor: Colors.white,
                        //                         fontWeight: FontWeight.w400,
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 5.h,
                        //                     ),
                        //                     CommonText(
                        //                       text:
                        //                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.',
                        //                       fontSize: 12.sp,
                        //                       fontColor: Colors.white,
                        //                       fontWeight: FontWeight.w300,
                        //                     ),
                        //                     SizedBox(
                        //                       height: 15.h,
                        //                     ),
                        //                     Row(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.end,
                        //                       children: [
                        //                         SizedBox(
                        //                             height: 30.h,
                        //                             width: 100.h,
                        //                             child: CommonElevatedButton(
                        //                                 fontSize: 12.sp,
                        //                                 text: 'Edit Profile',
                        //                                 onPressed: () {})),
                        //                       ],
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //       ),
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
