import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/myprofile/views/edit_profile.dart';

import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/them/const_color.dart';
import '../controllers/myprofile_controller.dart';

class MyprofileView extends GetView<MyprofileController> {
  const MyprofileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MyprofileController());
    return GetBuilder<MyprofileController>(builder: (controller) {
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
                                text: 'My Profile',
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
                        controller.profileDetails.isEmpty
                            ? const SizedBox()
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.profileDetails.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: ConstColor.textColor),
                                      child: Padding(
                                        padding: EdgeInsets.all(20.r),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleAvatar(
                                                radius: 40.r,
                                                backgroundColor: Colors.white,
                                                // backgroundImage:
                                                //     const AssetImage(
                                                //   'assets/assets_svg/profile.png',
                                                // ),

                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://www.scfinvestmentgroup.com/public/upload/user_image/${controller.profileDetails[index].profileImage}",

                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    width: 80.h,
                                                    height: 80.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),

                                                  fit: BoxFit.fitHeight,
                                                  // placeholder: (context,
                                                  //         url) =>
                                                  //     const CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    height: 50.h,
                                                    width: 50.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        color: ConstColor
                                                            .profileBackgroundColor),
                                                    child: Center(
                                                      child: Image.asset(
                                                          "assets/assets_svg/person.svg"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),

                                            Center(
                                              child: CommonText(
                                                text:
                                                    '${controller.profileDetails[index].firstName} ${controller.profileDetails[index].lastName}',
                                                fontSize: 16.sp,
                                                fontColor: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Center(
                                              child: CommonText(
                                                text: controller
                                                        .profileDetails[index]
                                                        .userType ??
                                                    '',
                                                fontSize: 12.sp,
                                                fontColor: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            // CommonText(
                                            //   text:
                                            //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.',
                                            //   fontSize: 12.sp,
                                            //   fontColor: Colors.white,
                                            //   fontWeight: FontWeight.w300,
                                            // ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                    height: 30.h,
                                                    width: 100.h,
                                                    child: CommonElevatedButton(
                                                        fontSize: 12.sp,
                                                        text: 'Edit Profile',
                                                        onPressed: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          Get.to(const EditProfile())!
                                                              .then((value) =>
                                                                  controller
                                                                      .getProfile());
                                                        })),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
