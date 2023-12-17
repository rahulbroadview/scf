import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/collectDocumentList.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/followup.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/widget/updateFileStatus.dart';
import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_formfield.dart';
import '../../../core/them/const_color.dart';
import '../../staffileslist/views/detailview.dart';
import '../controllers/adminfile_controller.dart';

class AdminFileListView extends GetView<AdminFilelistController> {
  const AdminFileListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AdminFilelistController());
    return GetBuilder<AdminFilelistController>(builder: (controller) {
      return SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            controller.navigateToDashboardView();
            return true;
          },
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
                                      controller.navigateToDashboardView();
                                    },
                                    child: const Icon(Icons.arrow_back_ios)),
                                CommonText(
                                  text: 'File',
                                  fontSize: 16.r,
                                )
                              ],
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     Get.to(const CreateFileView())!.then((value) {
                            //       controller.fileListApi();
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
                                controller: controller.searchController,
                                hintText:
                                    "Search by file number and customer name",
                                onChanged: (value) {
                                  controller.staffFilter(
                                      searchText: value.trim());
                                },
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 10),
                                  child: Image.asset(
                                    'assets/assets_svg/loupe.png',
                                    height: 18.h,
                                    width: 18.h,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.dialog(
                                  GetBuilder<AdminFilelistController>(
                                      builder: (controller) {
                                    return Form(
                                      key: controller.popupFormKey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Material(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const SizedBox(),
                                                          CommonText(
                                                              text:
                                                                  'Search By Filter'),
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
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.w,
                                                                right: 15.w),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CommonText(
                                                                text:
                                                                    'From Date'),
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
                                                              // validator:
                                                              //     (value) {
                                                              //   if (value!
                                                              //       .isEmpty) {
                                                              //     return "Please enter from date.";
                                                              //   } else {
                                                              //     return null;
                                                              //   }
                                                              // },
                                                            ),
                                                            SizedBox(
                                                              height: 15.h,
                                                            ),
                                                            CommonText(
                                                                text: 'To'),
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
                                                              // validator:
                                                              //     (value) {
                                                              //   if (value!
                                                              //       .isEmpty) {
                                                              //     return "Please enter to date.";
                                                              //   } else {
                                                              //     return null;
                                                              //   }
                                                              // },
                                                            ),
                                                            SizedBox(
                                                              height: 15.h,
                                                            ),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Divider(
                                                                      height: 4,
                                                                      thickness:
                                                                          2,
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.7),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15.w,
                                                                  ),
                                                                  CommonText(
                                                                      text:
                                                                          'OR'),
                                                                  SizedBox(
                                                                    width: 15.w,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Divider(
                                                                      height: 4,
                                                                      thickness:
                                                                          2,
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.7),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            CommonText(
                                                                text:
                                                                    'File Status'),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton2<
                                                                      String>(
                                                                isExpanded:
                                                                    true,
                                                                hint: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          CommonText(
                                                                        text:
                                                                            'Select Status',
                                                                        fontSize:
                                                                            12.r,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        fontColor:
                                                                            ConstColor.hintTextColor,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                items: controller
                                                                    .requireFileList
                                                                    .map(
                                                                      (item) =>
                                                                          DropdownMenuItem<
                                                                              String>(
                                                                        value:
                                                                            item,
                                                                        child:
                                                                            CommonText(
                                                                          text:
                                                                              item,
                                                                          fontSize:
                                                                              16,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    )
                                                                    .toList(),
                                                                value: controller
                                                                    .selectedFileStatus,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  controller
                                                                          .selectedFileStatus =
                                                                      newValue;
                                                                  controller
                                                                      .update();
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down),
                                                                iconEnabledColor:
                                                                    Colors
                                                                        .black,
                                                                buttonHeight:
                                                                    55,
                                                                buttonWidth:
                                                                    Get.width,
                                                                buttonPadding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
                                                                buttonDecoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.0,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                itemHeight: 40,
                                                                dropdownMaxHeight:
                                                                    200,
                                                                dropdownDecoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                dropdownElevation:
                                                                    3,
                                                                scrollbarRadius:
                                                                    const Radius
                                                                        .circular(
                                                                        10),
                                                                scrollbarThickness:
                                                                    6,
                                                                scrollbarAlwaysShow:
                                                                    true,
                                                                offset:
                                                                    const Offset(
                                                                        10, 10),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Center(
                                                              child: SizedBox(
                                                                width:
                                                                    Get.width,
                                                                height: 50.h,
                                                                child:
                                                                    CommonElevatedButton(
                                                                  bgColor:
                                                                      ConstColor
                                                                          .newBackgroundColor,
                                                                  radius: 10.r,
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  text: 'Apply',
                                                                  onPressed:
                                                                      () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
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
                                    );
                                  }),
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
                              child: controller.isLoder
                                  ? const SizedBox()
                                  : controller.fileList.isEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CommonText(text: "No records found")
                                          ],
                                        )
                                      : controller.fileFilterList != null
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .fileFilterList!.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 15.h),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                        FileDetailsView(
                                                          fileId: controller
                                                              .fileFilterList![
                                                                  index]
                                                              .id
                                                              .toString(),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            color: const Color(
                                                                0XFF225072)),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.w,
                                                                      right:
                                                                          10.w,
                                                                      top: 10.h,
                                                                      bottom:
                                                                          10.h),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            CommonText(
                                                                              text: "${controller.fileFilterList![index].fileStatus}",
                                                                              maxLine: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 14.sp,
                                                                              fontColor: Colors.white,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20.w,
                                                                            ),
                                                                            CustomPopupMenu(
                                                                              arrowSize: 0,
                                                                              horizontalMargin: 10,
                                                                              verticalMargin: 0,
                                                                              pressType: PressType.singleClick,
                                                                              controller: controller.popupContoller[index],
                                                                              menuBuilder: () => Container(
                                                                                height: 90.h,
                                                                                width: 200.w,
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.r)), boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Colors.grey,
                                                                                    blurRadius: 5.0,
                                                                                  ),
                                                                                ]),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(left: 5.w),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            controller.popupContoller[index].hideMenu();
                                                                                            Get.to(
                                                                                                CollectDocumentStaffView(
                                                                                                  fileId: controller.fileFilterList![index].id.toString(),
                                                                                                  loanId: controller.fileFilterList![index].loanCategoryId.toString(),
                                                                                                  fromAdmin: "fromAdmin",
                                                                                                ),
                                                                                                arguments: "fromAdmin");
                                                                                          },
                                                                                          child: Row(
                                                                                            children: [
                                                                                              const Icon(
                                                                                                Icons.file_open,
                                                                                                color: Colors.black,
                                                                                                size: 20,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 10.w,
                                                                                              ),
                                                                                              CommonText(
                                                                                                text: "Document Status",
                                                                                                fontColor: Colors.black,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 15.h),
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            controller.popupContoller[index].hideMenu();
                                                                                            Get.to(UpdateFileStatusView(
                                                                                              fileId: controller.fileFilterList![index].id.toString(),
                                                                                              fileNumber: controller.fileFilterList![index].fileNo.toString(),
                                                                                              fileStatus: controller.fileFilterList![index].fileStatus.toString(),
                                                                                            ))!
                                                                                                .then((value) {
                                                                                              controller.fileListApi();
                                                                                            });
                                                                                          },
                                                                                          child: Row(
                                                                                            children: [
                                                                                              const Icon(
                                                                                                Icons.file_copy,
                                                                                                color: Colors.black,
                                                                                                size: 20,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 10.w,
                                                                                              ),
                                                                                              CommonText(
                                                                                                text: "Update File Status",
                                                                                                fontColor: Colors.black,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              child: GestureDetector(
                                                                                  onTap: () {
                                                                                    controller.popupContoller[index].showMenu();
                                                                                  },
                                                                                  child: const Icon(
                                                                                    Icons.more_vert,
                                                                                    color: Colors.white,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        controller.fileFilterList![index].viewStaff !=
                                                                                null
                                                                            ? CommonText(
                                                                                text: "${controller.fileFilterList![index].viewUser!.firstName} ${controller.fileFilterList![index].viewUser!.lastName}",
                                                                                maxLine: 2,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontSize: 14.sp,
                                                                                fontColor: Colors.white,
                                                                              )
                                                                            : const SizedBox(),
                                                                        SizedBox(
                                                                          height:
                                                                              5.w,
                                                                        ),
                                                                        CommonText(
                                                                          text:
                                                                              "${controller.fileFilterList![index].fileNo}",
                                                                          maxLine:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontColor:
                                                                              Colors.white,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5.w,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  CommonText(
                                                                                    text: "Loan Amount",
                                                                                    maxLine: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    fontSize: 12.sp,
                                                                                    fontColor: Colors.white,
                                                                                  ),
                                                                                  CommonText(
                                                                                    text: "${controller.fileFilterList![index].loanAmount}",
                                                                                    maxLine: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    fontSize: 14.sp,
                                                                                    fontColor: Colors.white,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 30,
                                                                              width: 2,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(1.r),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20.w,
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  CommonText(
                                                                                    text: "Assign To",
                                                                                    maxLine: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    fontSize: 12.sp,
                                                                                    fontColor: Colors.white,
                                                                                  ),
                                                                                  controller.fileFilterList![index].viewStaff != null
                                                                                      ? CommonText(
                                                                                          text: "${controller.fileFilterList![index].viewStaff!.firstName} ${controller.fileFilterList![index].viewStaff!.lastName}",
                                                                                          maxLine: 2,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          fontSize: 14.sp,
                                                                                          fontColor: Colors.white,
                                                                                        )
                                                                                      : const SizedBox()
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                );
                                              },
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  controller.fileList.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 15.h),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                        FileDetailsView(
                                                          fileId: controller
                                                              .fileList[index]
                                                              .id
                                                              .toString(),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: controller
                                                                      .fileList[
                                                                          index]
                                                                      .viewStaff !=
                                                                  null
                                                              ? const Color(
                                                                  0XFF225072)
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      0.4),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.w,
                                                                      right:
                                                                          10.w,
                                                                      top: 10.h,
                                                                      bottom:
                                                                          10.h),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            CommonText(
                                                                              text: "${controller.fileList[index].fileStatus}",
                                                                              maxLine: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 14.sp,
                                                                              fontColor: controller.fileList[index].viewStaff != null ? Colors.white : Colors.black,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20.w,
                                                                            ),
                                                                            CustomPopupMenu(
                                                                              arrowSize: 0,
                                                                              horizontalMargin: 10,
                                                                              verticalMargin: 0,
                                                                              pressType: PressType.singleClick,
                                                                              controller: controller.popupContoller[index],
                                                                              menuBuilder: () => Container(
                                                                                height: 90.h,
                                                                                width: 200.w,
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.r)), boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Colors.grey,
                                                                                    blurRadius: 5.0,
                                                                                  ),
                                                                                ]),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(left: 5.w),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            controller.popupContoller[index].hideMenu();
                                                                                            Get.to(
                                                                                                CollectDocumentStaffView(
                                                                                                  fileId: controller.fileList[index].id.toString(),
                                                                                                  loanId: controller.fileList[index].loanCategoryId.toString(),
                                                                                                  fromAdmin: "fromAdmin",
                                                                                                ),
                                                                                                arguments: "fromAdmin");
                                                                                          },
                                                                                          child: Row(
                                                                                            children: [
                                                                                              const Icon(
                                                                                                Icons.file_open,
                                                                                                color: Colors.black,
                                                                                                size: 20,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 10.w,
                                                                                              ),
                                                                                              CommonText(
                                                                                                text: "Document Status",
                                                                                                fontColor: Colors.black,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 15.h),
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            controller.popupContoller[index].hideMenu();
                                                                                            Get.to(UpdateFileStatusView(
                                                                                              fileId: controller.fileList[index].id.toString(),
                                                                                              fileNumber: controller.fileList[index].fileNo.toString(),
                                                                                              fileStatus: controller.fileList[index].fileStatus.toString(),
                                                                                            ))!
                                                                                                .then((value) {
                                                                                              controller.fileListApi();
                                                                                            });
                                                                                          },
                                                                                          child: Row(
                                                                                            children: [
                                                                                              const Icon(
                                                                                                Icons.file_copy,
                                                                                                color: Colors.black,
                                                                                                size: 20,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 10.w,
                                                                                              ),
                                                                                              CommonText(
                                                                                                text: "Update File Status",
                                                                                                fontColor: Colors.black,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        // SizedBox(height: 15.h),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              child: GestureDetector(
                                                                                  onTap: () {
                                                                                    controller.popupContoller[index].showMenu();
                                                                                  },
                                                                                  child: const Icon(
                                                                                    Icons.more_vert,
                                                                                    color: Colors.white,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        controller.fileList[index].viewStaff !=
                                                                                null
                                                                            ? CommonText(
                                                                                text: "${controller.fileList[index].viewUser!.firstName} ${controller.fileList[index].viewUser!.lastName}",
                                                                                maxLine: 2,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontSize: 14.sp,
                                                                                fontColor: controller.fileList[index].viewStaff != null ? Colors.white : Colors.black,
                                                                              )
                                                                            : const SizedBox(),

                                                                        SizedBox(
                                                                          height:
                                                                              5.w,
                                                                        ),

                                                                        CommonText(
                                                                          text:
                                                                              "${controller.fileList[index].fileNo}",
                                                                          maxLine:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontColor: controller.fileList[index].viewStaff != null
                                                                              ? Colors.white
                                                                              : Colors.black,
                                                                        ),

                                                                        SizedBox(
                                                                          height:
                                                                              5.w,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  CommonText(
                                                                                    text: "Loan Amount",
                                                                                    maxLine: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    fontSize: 12.sp,
                                                                                    fontColor: controller.fileList[index].viewStaff != null ? Colors.white : Colors.black,
                                                                                  ),
                                                                                  CommonText(
                                                                                    text: "${controller.fileList[index].loanAmount}",
                                                                                    maxLine: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    fontSize: 14.sp,
                                                                                    fontColor: controller.fileList[index].viewStaff != null ? Colors.white : Colors.black,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 30,
                                                                              width: 2,
                                                                              decoration: BoxDecoration(
                                                                                color: controller.fileList[index].viewStaff != null ? Colors.white : Colors.black,
                                                                                borderRadius: BorderRadius.circular(1.r),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20.w,
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  controller.fileList[index].viewStaff != null
                                                                                      ? CommonText(
                                                                                          text: "Assign To",
                                                                                          maxLine: 2,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          fontSize: 12.sp,
                                                                                          fontColor: Colors.white,
                                                                                        )
                                                                                      : const SizedBox(),
                                                                                  controller.fileList[index].viewStaff != null
                                                                                      ? CommonText(
                                                                                          text: "${controller.fileList[index].viewStaff!.firstName} ${controller.fileList[index].viewStaff!.lastName}",
                                                                                          maxLine: 2,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          fontSize: 14.sp,
                                                                                          fontColor: Colors.white,
                                                                                        )
                                                                                      : const SizedBox()
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),

                                                                        SizedBox(
                                                                          height:
                                                                              10.h,
                                                                        ),

                                                                        // Row(
                                                                        //   children: [
                                                                        //     // Icon(
                                                                        //     //   Icons.timer_rounded,
                                                                        //     //   size: 14.h,
                                                                        //     //   color: ConstColor
                                                                        //     //       .greyTextColor,
                                                                        //     // ),
                                                                        //     // SizedBox(
                                                                        //     //   width: 5.w,
                                                                        //     // ),
                                                                        //     // CommonText(
                                                                        //     //     text: 'Just now',
                                                                        //     //     fontSize: 12.h,
                                                                        //     //     fontColor: ConstColor
                                                                        //     //         .greyTextColor),
                                                                        //   ],
                                                                        // )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // CommonText(
                                                                  // text: controller
                                                                  //         .fileList[
                                                                  //             index]
                                                                  //         .loanAmount ??
                                                                  //     '',
                                                                  // fontSize:
                                                                  //     12.h,
                                                                  // fontColor:
                                                                  //     ConstColor
                                                                  //         .greyTextColor),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
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
        ),
      );
    });
  }
}
