import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_button.dart';
import 'package:pay_day_manager/app/modules/addstaff/views/addstaff_view.dart';
import 'package:pay_day_manager/app/modules/details/views/details_view.dart';
import 'package:pay_day_manager/main.dart';

import '../../../alert_dialogs/common_dialog_header.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_formfield.dart';
import '../../../core/constant/common_method.dart';
import '../../../core/them/const_color.dart';
import '../controllers/staaflist_controller.dart';

class StaaflistView extends GetView<StaaflistController> {
  const StaaflistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(StaaflistController());
    return GetBuilder<StaaflistController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const AddstaffView())!.then((value) {
                // if (controller.refreshList) {
                controller.staffListApi();
                // }
              });
            },
            backgroundColor: ConstColor.buttonColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
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
                                text: 'Staff',
                                fontSize: 16.r,
                              )
                            ],
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.to(const AddstaffView())!.then((value) {
                          //       // if (controller.refreshList) {
                          //       controller.staffListApi();
                          //       // }
                          //     });
                          //   },
                          //   child: CircleAvatar(
                          //     radius: 12.r,
                          //     backgroundColor: ConstColor.buttonColor,
                          //     child: const Icon(
                          //       Icons.add,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CommonTextFormField(
                        borderRadius: 30.r,
                        fillColor: ConstColor.searchBackgroundColor,
                        borderColor: ConstColor.searchBackgroundColor,
                        hintText: "Search by staff",
                        controller: controller.searchController,
                        onChanged: (value) {
                          controller.staffFilter(searchText: value.trim());
                        },
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 10),
                          child: Image.asset(
                            'assets/assets_svg/loupe.png',
                            height: 18.h,
                            width: 18.h,
                          ),
                        ),
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
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                            child: controller.staffFilterList != null
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.staffFilterList!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Colors.white),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CustomPopupMenu(
                                                        arrowSize: 0,
                                                        horizontalMargin: 10,
                                                        verticalMargin: 0,
                                                        pressType: PressType
                                                            .singleClick,
                                                        controller: controller
                                                                .popupContoller[
                                                            index],
                                                        menuBuilder: () =>
                                                            Container(
                                                          height: 100.h,
                                                          width: 200.w,
                                                          decoration: BoxDecoration(
                                                              color: ConstColor
                                                                  .color1E3F84,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.r)),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  blurRadius:
                                                                      5.0,
                                                                ),
                                                              ]),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .popupContoller[
                                                                            index]
                                                                        .hideMenu();
                                                                    staffId = controller
                                                                        .staffList[
                                                                            index]
                                                                        .id
                                                                        .toString();
                                                                    Get.to(
                                                                        const AddstaffView(),
                                                                        arguments:
                                                                            controller.staffList[index]);
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10.w,
                                                                      ),
                                                                      CommonText(
                                                                        text:
                                                                            "Edit",
                                                                        fontColor:
                                                                            Colors.white,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .popupContoller[
                                                                              index]
                                                                          .hideMenu();
                                                                      Get.to(
                                                                          const DetailsView(),
                                                                          arguments:
                                                                              controller.staffList[index]);
                                                                      // Get.to(
                                                                      //     const AddcustomerView(),
                                                                      //     arguments:
                                                                      //         controller.customerList[index]);
                                                                    },
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .remove_red_eye,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        CommonText(
                                                                          text:
                                                                              "View",
                                                                          fontColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ],
                                                                    )),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .popupContoller[
                                                                              index]
                                                                          .hideMenu();
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          barrierDismissible:
                                                                              false,
                                                                          barrierColor: ConstColor.textColor.withOpacity(
                                                                              0.2),
                                                                          builder:
                                                                              (context) {
                                                                            return CommonDialogHeader(
                                                                              title: "Confirmation",
                                                                              bgColor: Colors.white,
                                                                              child: Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(height: getSize(value: 63).h),
                                                                                    CommonText(
                                                                                      text: 'Are you sure you want to delete this staff?',
                                                                                      fontSize: 14.sp,
                                                                                      fontWeight: FontWeight.w400,
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.only(top: getSize(value: 66).h, bottom: 30.h),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          SizedBox(
                                                                                            width: getSize(value: 354).w,
                                                                                            height: getSize(value: 88).h,
                                                                                            child: CommonElevatedButton(
                                                                                              text: "Yes".toUpperCase(),
                                                                                              onPressed: () {
                                                                                                Get.back();
                                                                                                controller.staffDelete(id: controller.staffFilterList![index].id.toString());
                                                                                                // controller.customerDelete(id: controller.customerList[index].id.toString());
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
                                                                    },
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        CommonText(
                                                                          text:
                                                                              "Delete",
                                                                          fontColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ],
                                                                    )),

                                                                // CommonText(text: "Edit"),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .popupContoller[
                                                                      index]
                                                                  .showMenu();
                                                            },
                                                            child: const Icon(
                                                                Icons
                                                                    .more_vert)),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w,
                                                        right: 10.w,
                                                        bottom: 10.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  "https://www.scfinvestmentgroup.com/public/upload/user_image/${controller.staffFilterList![index].profileImage}",
                                                              height: 60.h,
                                                              width: 60.h,
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                width: 60.h,
                                                                height: 60.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .cover),
                                                                ),
                                                              ),

                                                              // placeholder: (context,
                                                              //         url) =>
                                                              //     const CircularProgressIndicator(),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Container(
                                                                height: 50.h,
                                                                width: 50.h,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(10
                                                                            .r),
                                                                    color: ConstColor
                                                                        .profileBackgroundColor),
                                                                child: Center(
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          "assets/assets_svg/person.svg"),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CommonText(
                                                                  text:
                                                                      "${controller.staffFilterList![index].firstName.toString().capitalize} ${controller.staffFilterList![index].lastName.toString().capitalize}",
                                                                  maxLine: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .timer_rounded,
                                                                      size:
                                                                          14.h,
                                                                      color: ConstColor
                                                                          .greyTextColor,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          5.w,
                                                                    ),
                                                                    CommonText(
                                                                        text: DateFormat('dd-MM-yyyy').format(DateTime.parse(controller
                                                                            .staffFilterList![
                                                                                index]
                                                                            .createdAt
                                                                            .toString())),
                                                                        fontSize: 12
                                                                            .h,
                                                                        fontColor:
                                                                            ConstColor.greyTextColor),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      size:
                                                                          14.h,
                                                                      color: ConstColor
                                                                          .greyTextColor,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          5.w,
                                                                    ),
                                                                    CommonText(
                                                                        text: controller
                                                                            .staffFilterList![
                                                                                index]
                                                                            .mobileNo
                                                                            .toString(),
                                                                        fontSize: 12
                                                                            .h,
                                                                        fontColor:
                                                                            ConstColor.greyTextColor),
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Switch(
                                                            activeColor:
                                                                const Color(
                                                                    0xff0F9D3F),
                                                            value: controller
                                                                        .staffFilterList![
                                                                            index]
                                                                        .status ==
                                                                    'true'
                                                                ? true
                                                                : false,
                                                            onChanged: (val) {
                                                              if (controller
                                                                      .staffFilterList![
                                                                          index]
                                                                      .status ==
                                                                  'true') {
                                                                controller
                                                                    .staffFilterList![
                                                                        index]
                                                                    .status = 'false';
                                                              } else {
                                                                controller
                                                                    .staffFilterList![
                                                                        index]
                                                                    .status = 'true';
                                                              }
                                                              controller
                                                                  .update();
                                                            })
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.staffList.length,
                                    itemBuilder: (context, index) {
                                      print(controller
                                          .staffList[index].profileImage);
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.w,
                                                      left: 10.w,
                                                      right: 10.w,
                                                      bottom: 10.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CachedNetworkImage(
                                                            imageUrl:
                                                                "https://www.scfinvestmentgroup.com/public/upload/user_image/${controller.staffList[index].profileImage}",
                                                            height: 60.h,
                                                            width: 60.h,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                Container(
                                                              width: 60.h,
                                                              height: 60.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),

                                                            // placeholder: (context,
                                                            //         url) =>
                                                            //     const CircularProgressIndicator(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Container(
                                                              height: 50.h,
                                                              width: 50.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10
                                                                              .r),
                                                                  color: ConstColor
                                                                      .profileBackgroundColor),
                                                              child: Center(
                                                                child: SvgPicture
                                                                    .asset(
                                                                        "assets/assets_svg/person.svg"),
                                                              ),
                                                            ),
                                                          ),
                                                          // Container(
                                                          //   height: 50.h,
                                                          //   width: 50.h,
                                                          //   decoration: BoxDecoration(
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(10
                                                          //                   .r),
                                                          //       color: ConstColor
                                                          //           .profileBackgroundColor),
                                                          //   child: Center(
                                                          //     child: controller
                                                          //                 .staffList[
                                                          //                     index]
                                                          //                 .profileImage !=
                                                          //             null
                                                          //         ? Image.network(
                                                          //             " ${controller.staffList[index].profileImage!}")
                                                          //         : SvgPictures
                                                          //             .asset(
                                                          //                 "assets/assets_svg/person.svg"),
                                                          //   ),
                                                          // ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 100.w,
                                                                child:
                                                                    CommonText(
                                                                  text:
                                                                      "${controller.staffList[index].firstName.toString().capitalize} ${controller.staffList[index].lastName.toString().capitalize}",
                                                                  maxLine: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .timer_rounded,
                                                                    size: 14.h,
                                                                    color: ConstColor
                                                                        .greyTextColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  CommonText(
                                                                      text: DateFormat('dd-MM-yyyy').format(DateTime.parse(controller
                                                                          .staffList[
                                                                              index]
                                                                          .createdAt
                                                                          .toString())),
                                                                      fontSize:
                                                                          12.h,
                                                                      fontColor:
                                                                          ConstColor
                                                                              .greyTextColor),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.phone,
                                                                    size: 14.h,
                                                                    color: ConstColor
                                                                        .greyTextColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  CommonText(
                                                                      text: controller
                                                                          .staffList![
                                                                              index]
                                                                          .mobileNo
                                                                          .toString(),
                                                                      fontSize:
                                                                          12.h,
                                                                      fontColor:
                                                                          ConstColor
                                                                              .greyTextColor),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Switch(
                                                          activeColor:
                                                              const Color(
                                                                  0xff0F9D3F),
                                                          value: controller
                                                                      .staffList[
                                                                          index]
                                                                      .status ==
                                                                  'true'
                                                              ? true
                                                              : false,
                                                          onChanged: (val) {
                                                            if (controller
                                                                    .staffList[
                                                                        index]
                                                                    .status ==
                                                                'true') {
                                                              controller
                                                                      .staffList[
                                                                          index]
                                                                      .status =
                                                                  'false';
                                                            } else {
                                                              controller
                                                                      .staffList[
                                                                          index]
                                                                      .status =
                                                                  'true';
                                                            }
                                                            controller.update();
                                                          }),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomPopupMenu(
                                                            arrowSize: 0,
                                                            verticalMargin: 0,
                                                            horizontalMargin:
                                                                10,
                                                            pressType: PressType
                                                                .singleClick,
                                                            controller: controller
                                                                    .popupContoller[
                                                                index],
                                                            menuBuilder: () =>
                                                                Container(
                                                              height: 100.h,
                                                              width: 150.w,
                                                              decoration: BoxDecoration(
                                                                  color: ConstColor
                                                                      .color1E3F84,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.r)),
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      blurRadius:
                                                                          5.0,
                                                                    ),
                                                                  ]),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .popupContoller[index]
                                                                            .hideMenu();
                                                                        staffId = controller
                                                                            .staffList[index]
                                                                            .id
                                                                            .toString();
                                                                        Get.to(
                                                                            const AddstaffView(),
                                                                            arguments:
                                                                                controller.staffList[index]);
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.edit,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10.w,
                                                                          ),
                                                                          CommonText(
                                                                            text:
                                                                                "Edit",
                                                                            fontColor:
                                                                                Colors.white,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .popupContoller[index]
                                                                              .hideMenu();
                                                                          Get.to(
                                                                              const DetailsView(),
                                                                              arguments: controller.staffList[index]);
                                                                          // Get.to(
                                                                          //     const AddcustomerView(),
                                                                          //     arguments:
                                                                          //         controller.customerList[index]);
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(Icons.remove_red_eye,
                                                                                color: Colors.white,
                                                                                size: 20),
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                            CommonText(
                                                                              text: "View",
                                                                              fontColor: Colors.white,
                                                                            ),
                                                                          ],
                                                                        )),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .popupContoller[index]
                                                                              .hideMenu();
                                                                          showDialog(
                                                                              context: context,
                                                                              barrierDismissible: false,
                                                                              barrierColor: ConstColor.textColor.withOpacity(0.2),
                                                                              builder: (context) {
                                                                                return CommonDialogHeader(
                                                                                  title: "Confirmation",
                                                                                  bgColor: Colors.white,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(height: getSize(value: 63).h),
                                                                                        CommonText(
                                                                                          text: 'Are you sure you want to delete this staff?',
                                                                                          fontSize: 14.sp,
                                                                                          fontWeight: FontWeight.w400,
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsets.only(top: getSize(value: 66).h, bottom: 30.h),
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: getSize(value: 354).w,
                                                                                                height: getSize(value: 88).h,
                                                                                                child: CommonElevatedButton(
                                                                                                  text: "Yes".toUpperCase(),
                                                                                                  onPressed: () {
                                                                                                    Get.back();
                                                                                                    controller.staffDelete(id: controller.staffList[index].id.toString());
                                                                                                    // controller.customerDelete(id: controller.customerList[index].id.toString());
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
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.delete,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                            CommonText(
                                                                              text: "Delete",
                                                                              fontColor: Colors.white,
                                                                            ),
                                                                          ],
                                                                        )),

                                                                    // CommonText(text: "Edit"),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .popupContoller[
                                                                              index]
                                                                          .showMenu();
                                                                    },
                                                                    child: const Icon(
                                                                        Icons
                                                                            .more_vert)),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                                    },
                                  )),
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
