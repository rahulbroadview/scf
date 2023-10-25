import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_formfield.dart';
import '../../../core/them/const_color.dart';
import '../controllers/staffcustomerlist_controller.dart';

class StaffCustomerListView extends GetView<StaffCustomerListController> {
  const StaffCustomerListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(StaffCustomerListController());
    return GetBuilder<StaffCustomerListController>(builder: (controller) {
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
                                text: 'Customer List',
                                fontSize: 16.r,
                              )
                            ],
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.to(const AddstaffView())!.then((value) {
                          //       // if (controller.refreshList) {
                          //       controller.customerListApi();
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
                      Row(
                        children: [
                          Expanded(
                            child: CommonTextFormField(
                              borderRadius: 30.r,
                              fillColor: ConstColor.searchBackgroundColor,
                              borderColor: ConstColor.searchBackgroundColor,
                              hintText: "Search by customer",
                              controller: controller.searchController,
                              onChanged: (value) {
                                controller.staffFilter(
                                    searchText: value.trim());
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
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.fromDateController.clear();
                              controller.toDateController.clear();
                              Get.dialog(
                                Form(
                                  key: controller.popupFormKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.r),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CommonText(
                                                          text: 'Sort By Date'),
                                                      IconButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          icon: const Icon(
                                                              Icons.close))
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1.h,
                                                    color: Colors.black,
                                                  ),

                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15.w,
                                                        right: 15.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonText(
                                                            text: 'From Date'),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        CommonTextFormField(
                                                          isReadOnly: true,
                                                          onTap: () {
                                                            controller
                                                                .selectDate(
                                                                    context);
                                                          },
                                                          fillColor:
                                                              Colors.white,
                                                          hintText: '',
                                                          controller: controller
                                                              .fromDateController,
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please enter from date.";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 15.h,
                                                        ),
                                                        CommonText(text: 'To'),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        CommonTextFormField(
                                                          onTap: () {
                                                            if (controller
                                                                    .selectedDate ==
                                                                null) {
                                                              Get.rawSnackbar(
                                                                  message:
                                                                      "Please select from date.",
                                                                  backgroundColor:
                                                                      ConstColor
                                                                          .errorColor);
                                                            } else {
                                                              controller
                                                                  .selectDate1(
                                                                      context);
                                                            }
                                                          },
                                                          isReadOnly: true,
                                                          fillColor:
                                                              Colors.white,
                                                          hintText: '',
                                                          controller: controller
                                                              .toDateController,
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please enter to date.";
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
                                                            width: 200,
                                                            height: 50.h,
                                                            child:
                                                                CommonElevatedButton(
                                                              bgColor: ConstColor
                                                                  .newBackgroundColor,
                                                              radius: 10.r,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              text: 'Save',
                                                              onPressed: () {
                                                                if (controller
                                                                    .popupFormKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  Get.back();
                                                                  controller
                                                                      .dateFilter();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 20.h,
                                                  )
                                                  //Buttons
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/assets_svg/filter.png',
                              height: 25.h,
                              width: 25.h,
                            ),
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
                                            child: Column(
                                              children: [
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.end,
                                                //   children: [
                                                //     CustomPopupMenu(
                                                //       arrowSize: 0,
                                                //       pressType:
                                                //           PressType.singleClick,
                                                //       controller: controller
                                                //               .popupContoller[
                                                //           index],
                                                //       menuBuilder: () =>
                                                //           Container(
                                                //         height: 100.h,
                                                //         width: 100.w,
                                                //         decoration: BoxDecoration(
                                                //             color: Colors.white,
                                                //             borderRadius:
                                                //                 BorderRadius.all(
                                                //                     Radius.circular(
                                                //                         10.r)),
                                                //             boxShadow: const [
                                                //               BoxShadow(
                                                //                 color:
                                                //                     Colors.grey,
                                                //                 blurRadius: 5.0,
                                                //               ),
                                                //             ]),
                                                //         child: Padding(
                                                //           padding:
                                                //               const EdgeInsets
                                                //                   .all(8.0),
                                                //           child: Column(
                                                //             crossAxisAlignment:
                                                //                 CrossAxisAlignment
                                                //                     .start,
                                                //             children: [
                                                //               GestureDetector(
                                                //                 onTap: () {
                                                //                   controller
                                                //                       .popupContoller[
                                                //                           index]
                                                //                       .hideMenu();
                                                //                   staffId = controller
                                                //                       .customerList[
                                                //                           index]
                                                //                       .id
                                                //                       .toString();
                                                //                   Get.to(
                                                //                       const AddstaffView(),
                                                //                       arguments:
                                                //                           controller
                                                //                               .customerList[index]);
                                                //                 },
                                                //                 child: CommonText(
                                                //                     text:
                                                //                         "Edit"),
                                                //               ),
                                                //               SizedBox(
                                                //                 height: 5.h,
                                                //               ),
                                                //               GestureDetector(
                                                //                   onTap: () {
                                                //                     controller
                                                //                         .popupContoller[
                                                //                             index]
                                                //                         .hideMenu();
                                                //                     // Get.to(
                                                //                     //     const AddcustomerView(),
                                                //                     //     arguments:
                                                //                     //         controller.customerList[index]);
                                                //                   },
                                                //                   child: CommonText(
                                                //                       text:
                                                //                           "View")),
                                                //               SizedBox(
                                                //                 height: 5.h,
                                                //               ),
                                                //               GestureDetector(
                                                //                   onTap: () {
                                                //                     controller
                                                //                         .popupContoller[
                                                //                             index]
                                                //                         .hideMenu();
                                                //                     showDialog(
                                                //                         context:
                                                //                             context,
                                                //                         barrierDismissible:
                                                //                             false,
                                                //                         barrierColor: ConstColor
                                                //                             .textColor
                                                //                             .withOpacity(
                                                //                                 0.2),
                                                //                         builder:
                                                //                             (context) {
                                                //                           return CommonDialogHeader(
                                                //                             title:
                                                //                                 "Confirmation",
                                                //                             bgColor:
                                                //                                 Colors.white,
                                                //                             child:
                                                //                                 Padding(
                                                //                               padding: EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                                                //                               child: Column(
                                                //                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                //                                 children: [
                                                //                                   SizedBox(height: getSize(value: 63).h),
                                                //                                   CommonText(
                                                //                                     text: 'Are you sure you want to delete this customer?',
                                                //                                     fontSize: 14.sp,
                                                //                                     fontWeight: FontWeight.w400,
                                                //                                     textAlign: TextAlign.center,
                                                //                                   ),
                                                //                                   Padding(
                                                //                                     padding: EdgeInsets.only(top: getSize(value: 66).h, bottom: 30.h),
                                                //                                     child: Row(
                                                //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //                                       children: [
                                                //                                         SizedBox(
                                                //                                           width: getSize(value: 354).w,
                                                //                                           height: getSize(value: 88).h,
                                                //                                           child: CommonElevatedButton(
                                                //                                             text: "Yes".toUpperCase(),
                                                //                                             onPressed: () {
                                                //                                               Get.back();
                                                //                                               // controller.customerDelete(id: controller.customerList[index].id.toString());
                                                //                                             },
                                                //                                             textColor: ConstColor.newBackgroundColor,
                                                //                                             bgColor: ConstColor.newBackgroundColor,
                                                //                                             fontWeight: FontWeight.w700,
                                                //                                             fontSize: 14.sp,
                                                //                                           ),
                                                //                                         ),
                                                //                                         SizedBox(
                                                //                                           width: getSize(value: 354).w,
                                                //                                           height: getSize(value: 88).h,
                                                //                                           child: CommonTextButton(
                                                //                                             text: "No".toUpperCase(),
                                                //                                             onPressed: () {
                                                //                                               Get.back();
                                                //                                               Get.back();
                                                //                                             },
                                                //                                             textColor: ConstColor.textColor,
                                                //                                             fontWeight: FontWeight.w700,
                                                //                                             fontSize: 16.sp,
                                                //                                           ),
                                                //                                         ),
                                                //                                       ],
                                                //                                     ),
                                                //                                   ),
                                                //                                 ],
                                                //                               ),
                                                //                             ),
                                                //                           );
                                                //                         });
                                                //                   },
                                                //                   child: CommonText(
                                                //                       text:
                                                //                           "Delete")),

                                                //               // CommonText(text: "Edit"),
                                                //             ],
                                                //           ),
                                                //         ),
                                                //       ),
                                                //       child: GestureDetector(
                                                //           onTap: () {
                                                //             controller
                                                //                 .popupContoller[
                                                //                     index]
                                                //                 .showMenu();
                                                //           },
                                                //           child: const Icon(
                                                //               Icons.more_vert)),
                                                //     ),
                                                //   ],
                                                // ),

                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w,
                                                      right: 10.w,
                                                      top: 10.h,
                                                      bottom: 10.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
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
                                                                    "${controller.staffFilterList![index].firstName} ${controller.staffFilterList![index].lastName}",
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
                                                                    size: 14.h,
                                                                    color: ConstColor
                                                                        .greyTextColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  CommonText(
                                                                      text: DateFormat('dd-MM-yyyy').format(DateTime.parse(controller
                                                                          .staffFilterList![
                                                                              index]
                                                                          .createdAt
                                                                          .toString())),
                                                                      fontSize:
                                                                          12.h,
                                                                      fontColor:
                                                                          ConstColor
                                                                              .greyTextColor),
                                                                ],
                                                              )
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
                                                            controller.update();
                                                          })
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.customerList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.end,
                                                //   children: [
                                                //     CustomPopupMenu(
                                                //       arrowSize: 0,
                                                //       pressType:
                                                //           PressType.singleClick,
                                                //       controller: controller
                                                //               .popupContoller[
                                                //           index],
                                                //       menuBuilder: () =>
                                                //           Container(
                                                //         height: 100.h,
                                                //         width: 100.w,
                                                //         decoration: BoxDecoration(
                                                //             color: Colors.white,
                                                //             borderRadius:
                                                //                 BorderRadius.all(
                                                //                     Radius.circular(
                                                //                         10.r)),
                                                //             boxShadow: const [
                                                //               BoxShadow(
                                                //                 color:
                                                //                     Colors.grey,
                                                //                 blurRadius: 5.0,
                                                //               ),
                                                //             ]),
                                                //         child: Padding(
                                                //           padding:
                                                //               const EdgeInsets
                                                //                   .all(8.0),
                                                //           child: Column(
                                                //             crossAxisAlignment:
                                                //                 CrossAxisAlignment
                                                //                     .start,
                                                //             children: [
                                                //               GestureDetector(
                                                //                 onTap: () {
                                                //                   controller
                                                //                       .popupContoller[
                                                //                           index]
                                                //                       .hideMenu();
                                                //                   staffId = controller
                                                //                       .customerList[
                                                //                           index]
                                                //                       .id
                                                //                       .toString();
                                                //                   Get.to(
                                                //                       const AddstaffView(),
                                                //                       arguments:
                                                //                           controller
                                                //                               .customerList[index]);
                                                //                 },
                                                //                 child: CommonText(
                                                //                     text:
                                                //                         "Edit"),
                                                //               ),
                                                //               SizedBox(
                                                //                 height: 5.h,
                                                //               ),
                                                //               GestureDetector(
                                                //                   onTap: () {
                                                //                     controller
                                                //                         .popupContoller[
                                                //                             index]
                                                //                         .hideMenu();
                                                //                     // Get.to(
                                                //                     //     const AddcustomerView(),
                                                //                     //     arguments:
                                                //                     //         controller.customerList[index]);
                                                //                   },
                                                //                   child: CommonText(
                                                //                       text:
                                                //                           "View")),
                                                //               SizedBox(
                                                //                 height: 5.h,
                                                //               ),
                                                //               GestureDetector(
                                                //                   onTap: () {
                                                //                     controller
                                                //                         .popupContoller[
                                                //                             index]
                                                //                         .hideMenu();
                                                //                     showDialog(
                                                //                         context:
                                                //                             context,
                                                //                         barrierDismissible:
                                                //                             false,
                                                //                         barrierColor: ConstColor
                                                //                             .textColor
                                                //                             .withOpacity(
                                                //                                 0.2),
                                                //                         builder:
                                                //                             (context) {
                                                //                           return CommonDialogHeader(
                                                //                             title:
                                                //                                 "Confirmation",
                                                //                             bgColor:
                                                //                                 Colors.white,
                                                //                             child:
                                                //                                 Padding(
                                                //                               padding: EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                                                //                               child: Column(
                                                //                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                //                                 children: [
                                                //                                   SizedBox(height: getSize(value: 63).h),
                                                //                                   CommonText(
                                                //                                     text: 'Are you sure you want to delete this customer?',
                                                //                                     fontSize: 14.sp,
                                                //                                     fontWeight: FontWeight.w400,
                                                //                                     textAlign: TextAlign.center,
                                                //                                   ),
                                                //                                   Padding(
                                                //                                     padding: EdgeInsets.only(top: getSize(value: 66).h, bottom: 30.h),
                                                //                                     child: Row(
                                                //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //                                       children: [
                                                //                                         SizedBox(
                                                //                                           width: getSize(value: 354).w,
                                                //                                           height: getSize(value: 88).h,
                                                //                                           child: CommonElevatedButton(
                                                //                                             text: "Yes".toUpperCase(),
                                                //                                             onPressed: () {
                                                //                                               Get.back();
                                                //                                               // controller.customerDelete(id: controller.customerList[index].id.toString());
                                                //                                             },
                                                //                                             textColor: ConstColor.newBackgroundColor,
                                                //                                             bgColor: ConstColor.newBackgroundColor,
                                                //                                             fontWeight: FontWeight.w700,
                                                //                                             fontSize: 14.sp,
                                                //                                           ),
                                                //                                         ),
                                                //                                         SizedBox(
                                                //                                           width: getSize(value: 354).w,
                                                //                                           height: getSize(value: 88).h,
                                                //                                           child: CommonTextButton(
                                                //                                             text: "No".toUpperCase(),
                                                //                                             onPressed: () {
                                                //                                               Get.back();
                                                //                                               Get.back();
                                                //                                             },
                                                //                                             textColor: ConstColor.textColor,
                                                //                                             fontWeight: FontWeight.w700,
                                                //                                             fontSize: 16.sp,
                                                //                                           ),
                                                //                                         ),
                                                //                                       ],
                                                //                                     ),
                                                //                                   ),
                                                //                                 ],
                                                //                               ),
                                                //                             ),
                                                //                           );
                                                //                         });
                                                //                   },
                                                //                   child: CommonText(
                                                //                       text:
                                                //                           "Delete")),

                                                //               // CommonText(text: "Edit"),
                                                //             ],
                                                //           ),
                                                //         ),
                                                //       ),
                                                //       child: GestureDetector(
                                                //           onTap: () {
                                                //             controller
                                                //                 .popupContoller[
                                                //                     index]
                                                //                 .showMenu();
                                                //           },
                                                //           child: const Icon(
                                                //               Icons.more_vert)),
                                                //     ),
                                                //   ],
                                                // ),

                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w,
                                                      right: 10.w,
                                                      top: 10.h,
                                                      bottom: 10.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
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
                                                                    "${controller.customerList[index].firstName} ${controller.customerList[index].lastName}",
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
                                                                    size: 14.h,
                                                                    color: ConstColor
                                                                        .greyTextColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  CommonText(
                                                                      text: DateFormat('dd-MM-yyyy').format(DateTime.parse(controller
                                                                          .customerList[
                                                                              index]
                                                                          .createdAt
                                                                          .toString())),
                                                                      fontSize:
                                                                          12.h,
                                                                      fontColor:
                                                                          ConstColor
                                                                              .greyTextColor),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Switch(
                                                          activeColor:
                                                              const Color(
                                                                  0xff0F9D3F),
                                                          value: controller
                                                                      .customerList[
                                                                          index]
                                                                      .status ==
                                                                  'true'
                                                              ? true
                                                              : false,
                                                          onChanged: (val) {
                                                            if (controller
                                                                    .customerList[
                                                                        index]
                                                                    .status ==
                                                                'true') {
                                                              controller
                                                                  .customerList[
                                                                      index]
                                                                  .status = 'false';
                                                            } else {
                                                              controller
                                                                  .customerList[
                                                                      index]
                                                                  .status = 'true';
                                                            }
                                                            controller.update();
                                                          })
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
