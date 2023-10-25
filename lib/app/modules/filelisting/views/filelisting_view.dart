import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/alert_dialogs/common_dialog_header.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_button.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';
import '../../../../models/stafflist_model.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_formfield.dart';
import '../../../core/them/const_color.dart';
import '../../createfile/views/createfile_view.dart';
import '../controllers/filelisting_controller.dart';

class FileListView extends GetView<FilelistController> {
  const FileListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FilelistController());
    return GetBuilder<FilelistController>(builder: (controller) {
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
                                text: 'File',
                                fontSize: 16.r,
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print(controller.customerName);
                              Get.to(const CreateFileView(),
                                      arguments: controller.customerName)!
                                  .then((value) {
                                controller.fileListApi();
                              });
                            },
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: ConstColor.buttonColor,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CommonTextFormField(
                        borderRadius: 30.r,
                        fillColor: ConstColor.searchBackgroundColor,
                        borderColor: ConstColor.searchBackgroundColor,
                        hintText: "Search by file",
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
                            child: controller.isLoder
                                ? const SizedBox()
                                : controller.fileList.isEmpty
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(
                                          //   height: 60.h,
                                          // ),
                                          CommonText(text: "No records found")
                                        ],
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.fileList.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 15.h),
                                            child: GestureDetector(
                                              onTap: () {
                                                // Get.to(
                                                //   // FileDetailsView(
                                                //   //   fileId: controller
                                                //   //       .fileList[index]
                                                //   //       .id
                                                //   //       .toString(),
                                                //   // ),
                                                // );
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
                                                                    MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      CommonText(
                                                                        text: "${controller.fileList[index].fileStatus}",
                                                                        maxLine: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        fontSize: 14.sp,
                                                                        fontColor: Colors.white,
                                                                      ),
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
                                                                                        showDialog(
                                                                                            context:
                                                                                            context,
                                                                                            barrierDismissible:
                                                                                            false,
                                                                                            barrierColor: ConstColor.textColor.withOpacity(
                                                                                                0.2),
                                                                                            builder:
                                                                                                (context) {
                                                                                              return GetBuilder<FilelistController>(builder:
                                                                                                  (context) {
                                                                                                return CommonDialogHeader(
                                                                                                  title: "Assign To Staff",
                                                                                                  showCloseIcon: true,
                                                                                                  bgColor: Colors.white,
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                                                                                                    child: Column(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        SizedBox(height: getSize(value: 63).h),
                                                                                                        DropdownButtonHideUnderline(
                                                                                                          child: DropdownButton2<StaffList>(
                                                                                                            isExpanded: true,
                                                                                                            hint: Row(
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: CommonText(
                                                                                                                    text: 'Select Staff',
                                                                                                                    fontSize: 12.r,
                                                                                                                    overflow: TextOverflow.ellipsis,
                                                                                                                    fontColor: ConstColor.hintTextColor,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            items: controller.staffList
                                                                                                                .map(
                                                                                                                  (item) => DropdownMenuItem<StaffList>(
                                                                                                                value: item,
                                                                                                                child: CommonText(
                                                                                                                  text: "${item.firstName} ${item.lastName}" ?? '',
                                                                                                                  fontSize: 16,
                                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                                ),
                                                                                                              ),
                                                                                                            )
                                                                                                                .toList(),
                                                                                                            value: controller.selectedStaffLit,
                                                                                                            onChanged: (StaffList? newValue) {
                                                                                                              controller.selectedStaffLit = newValue;
                                                                                                              controller.update();
                                                                                                            },
                                                                                                            icon: const Icon(Icons.keyboard_arrow_down),
                                                                                                            iconEnabledColor: Colors.black,
                                                                                                            buttonHeight: 50,
                                                                                                            buttonWidth: Get.width,
                                                                                                            buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                                                                                                            buttonDecoration: BoxDecoration(
                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                              border: Border.all(color: Colors.black, width: 1),
                                                                                                              color: Colors.white,
                                                                                                            ),
                                                                                                            itemHeight: 40,
                                                                                                            dropdownMaxHeight: 200,
                                                                                                            dropdownDecoration: BoxDecoration(
                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                              color: Colors.white,
                                                                                                            ),
                                                                                                            dropdownElevation: 3,
                                                                                                            scrollbarRadius: const Radius.circular(10),
                                                                                                            scrollbarThickness: 6,
                                                                                                            scrollbarAlwaysShow: true,
                                                                                                            offset: const Offset(10, 10),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsets.only(top: getSize(value: 66).h, bottom: 30.h),
                                                                                                          child: Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              SizedBox(
                                                                                                                width: getSize(value: 354).w,
                                                                                                                height: getSize(value: 88).h,
                                                                                                                child: CommonElevatedButton(
                                                                                                                  text: "Save".toUpperCase(),
                                                                                                                  onPressed: () {
                                                                                                                    if (controller.selectedStaffLit == null) {
                                                                                                                      Get.rawSnackbar(message: "Please select staff.", backgroundColor: ConstColor.errorColor);
                                                                                                                    } else {
                                                                                                                      Get.back();
                                                                                                                      controller.assignfileListApi(fileName: controller.fileList[index].fileNo, fileId: controller.fileList[index].id.toString());
                                                                                                                    }
                                                                                                                    // Get.back();
                                                                                                                    // controller.customerDelete(id: controller.customerFilterList![index].id.toString());
                                                                                                                  },
                                                                                                                  textColor: ConstColor.newBackgroundColor,
                                                                                                                  bgColor: ConstColor.newBackgroundColor,
                                                                                                                  fontWeight: FontWeight.w700,
                                                                                                                  fontSize: 14.sp,
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
                                                                                            });

                                                                                        // customerId = controller
                                                                                        //     .customerFilterList![
                                                                                        //         index]
                                                                                        //     .id
                                                                                        //     .toString();
                                                                                        // Get.to(
                                                                                        //     const FileListView());
                                                                                      },
                                                                                      child:
                                                                                      Row(
                                                                                        children: [
                                                                                          Icon(Icons.file_copy,color: Colors.white,size: 20,),
                                                                                          SizedBox(width: 10.w,),
                                                                                          CommonText(
                                                                                            text:
                                                                                            "Assign Files",
                                                                                            fontColor:
                                                                                            Colors
                                                                                                .white,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5.h,
                                                                                    ),
                                                                                    GestureDetector(
                                                                                        onTap:
                                                                                            () {
                                                                                          controller
                                                                                              .popupContoller[index]
                                                                                              .hideMenu();
                                                                                          // Get.to(
                                                                                          //     const AddcustomerView(),
                                                                                          //     arguments:
                                                                                          //         controller.customerFilterList![index]);
                                                                                        },
                                                                                        child:
                                                                                        Row(
                                                                                          children: [
                                                                                            Icon(Icons.edit,color: Colors.white,size: 20,),
                                                                                            SizedBox(width: 10.w,),
                                                                                            CommonText(
                                                                                              text:
                                                                                              "Edit",
                                                                                              fontColor:
                                                                                              Colors.white,
                                                                                            ),
                                                                                          ],
                                                                                        )),
                                                                                    SizedBox(
                                                                                      height: 5.h,
                                                                                    ),
                                                                                    GestureDetector(
                                                                                        onTap:
                                                                                            () {},
                                                                                        child:
                                                                                        Row(
                                                                                          children: [
                                                                                            Icon(Icons.delete,color: Colors.white,size: 20,),
                                                                                            SizedBox(width: 10.w,),
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
                                                                                    .more_vert,color: Colors.white,)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  CommonText(
                                                                    text: "${controller.fileList[index].viewUser!.firstName} ${controller.fileList[index].viewUser!.lastName}",
                                                                    maxLine: 2,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    fontSize: 14.sp,
                                                                    fontColor: Colors.white,
                                                                  ),


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
                                                                              text: "${controller.fileList[index].loanAmount}",
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
                                                                            CommonText(
                                                                              text: "${controller.fileList[index].bankName}",
                                                                              maxLine: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 14.sp,
                                                                              fontColor: Colors.white,
                                                                            )

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
                                          //   Padding(
                                          //   padding:
                                          //       EdgeInsets.only(bottom: 15.h),
                                          //   child: Container(
                                          //       decoration: BoxDecoration(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10.r),
                                          //           color: Colors.white),
                                          //       child: Column(
                                          //         children: [
                                          //           Row(
                                          //             mainAxisAlignment:
                                          //                 MainAxisAlignment.end,
                                          //             children: [
                                          //               CustomPopupMenu(
                                          //                 arrowSize: 0,
                                          //                 horizontalMargin: 10,
                                          //                 verticalMargin: 0,
                                          //                 pressType: PressType
                                          //                     .singleClick,
                                          //                 controller: controller
                                          //                         .popupContoller[
                                          //                     index],
                                          //                 menuBuilder: () =>
                                          //                     Container(
                                          //                   height: 100.h,
                                          //                   width: 200.w,
                                          //                   decoration: BoxDecoration(
                                          //                       color: ConstColor
                                          //                           .color1E3F84,
                                          //                       borderRadius: BorderRadius
                                          //                           .all(Radius
                                          //                               .circular(
                                          //                                   10.r)),
                                          //                       boxShadow: const [
                                          //                         BoxShadow(
                                          //                           color: Colors
                                          //                               .grey,
                                          //                           blurRadius:
                                          //                               5.0,
                                          //                         ),
                                          //                       ]),
                                          //                   child: Padding(
                                          //                     padding:
                                          //                         const EdgeInsets
                                          //                             .all(8.0),
                                          //                     child: Column(
                                          //                       crossAxisAlignment:
                                          //                           CrossAxisAlignment
                                          //                               .start,
                                          //                       children: [
                                          //                         GestureDetector(
                                          //                           onTap: () {
                                          //                             controller
                                          //                                 .popupContoller[
                                          //                                     index]
                                          //                                 .hideMenu();
                                          //                             showDialog(
                                          //                                 context:
                                          //                                     context,
                                          //                                 barrierDismissible:
                                          //                                     false,
                                          //                                 barrierColor: ConstColor.textColor.withOpacity(
                                          //                                     0.2),
                                          //                                 builder:
                                          //                                     (context) {
                                          //                                   return GetBuilder<FilelistController>(builder:
                                          //                                       (context) {
                                          //                                     return CommonDialogHeader(
                                          //                                       title: "Assign To Staff",
                                          //                                       showCloseIcon: true,
                                          //                                       bgColor: Colors.white,
                                          //                                       child: Padding(
                                          //                                         padding: EdgeInsets.symmetric(horizontal: getSize(value: 50).w),
                                          //                                         child: Column(
                                          //                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                           children: [
                                          //                                             SizedBox(height: getSize(value: 63).h),
                                          //                                             DropdownButtonHideUnderline(
                                          //                                               child: DropdownButton2<StaffList>(
                                          //                                                 isExpanded: true,
                                          //                                                 hint: Row(
                                          //                                                   children: [
                                          //                                                     Expanded(
                                          //                                                       child: CommonText(
                                          //                                                         text: 'Select Staff',
                                          //                                                         fontSize: 12.r,
                                          //                                                         overflow: TextOverflow.ellipsis,
                                          //                                                         fontColor: ConstColor.hintTextColor,
                                          //                                                       ),
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                                 items: controller.staffList
                                          //                                                     .map(
                                          //                                                       (item) => DropdownMenuItem<StaffList>(
                                          //                                                         value: item,
                                          //                                                         child: CommonText(
                                          //                                                           text: "${item.firstName} ${item.lastName}" ?? '',
                                          //                                                           fontSize: 16,
                                          //                                                           overflow: TextOverflow.ellipsis,
                                          //                                                         ),
                                          //                                                       ),
                                          //                                                     )
                                          //                                                     .toList(),
                                          //                                                 value: controller.selectedStaffLit,
                                          //                                                 onChanged: (StaffList? newValue) {
                                          //                                                   controller.selectedStaffLit = newValue;
                                          //                                                   controller.update();
                                          //                                                 },
                                          //                                                 icon: const Icon(Icons.keyboard_arrow_down),
                                          //                                                 iconEnabledColor: Colors.black,
                                          //                                                 buttonHeight: 50,
                                          //                                                 buttonWidth: Get.width,
                                          //                                                 buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                                          //                                                 buttonDecoration: BoxDecoration(
                                          //                                                   borderRadius: BorderRadius.circular(10),
                                          //                                                   border: Border.all(color: Colors.black, width: 1),
                                          //                                                   color: Colors.white,
                                          //                                                 ),
                                          //                                                 itemHeight: 40,
                                          //                                                 dropdownMaxHeight: 200,
                                          //                                                 dropdownDecoration: BoxDecoration(
                                          //                                                   borderRadius: BorderRadius.circular(10),
                                          //                                                   color: Colors.white,
                                          //                                                 ),
                                          //                                                 dropdownElevation: 3,
                                          //                                                 scrollbarRadius: const Radius.circular(10),
                                          //                                                 scrollbarThickness: 6,
                                          //                                                 scrollbarAlwaysShow: true,
                                          //                                                 offset: const Offset(10, 10),
                                          //                                               ),
                                          //                                             ),
                                          //                                             Padding(
                                          //                                               padding: EdgeInsets.only(top: getSize(value: 66).h, bottom: 30.h),
                                          //                                               child: Row(
                                          //                                                 mainAxisAlignment: MainAxisAlignment.center,
                                          //                                                 children: [
                                          //                                                   SizedBox(
                                          //                                                     width: getSize(value: 354).w,
                                          //                                                     height: getSize(value: 88).h,
                                          //                                                     child: CommonElevatedButton(
                                          //                                                       text: "Save".toUpperCase(),
                                          //                                                       onPressed: () {
                                          //                                                         if (controller.selectedStaffLit == null) {
                                          //                                                           Get.rawSnackbar(message: "Please select staff.", backgroundColor: ConstColor.errorColor);
                                          //                                                         } else {
                                          //                                                           Get.back();
                                          //                                                           controller.assignfileListApi(fileName: controller.fileList[index].fileNo, fileId: controller.fileList[index].id.toString());
                                          //                                                         }
                                          //                                                         // Get.back();
                                          //                                                         // controller.customerDelete(id: controller.customerFilterList![index].id.toString());
                                          //                                                       },
                                          //                                                       textColor: ConstColor.newBackgroundColor,
                                          //                                                       bgColor: ConstColor.newBackgroundColor,
                                          //                                                       fontWeight: FontWeight.w700,
                                          //                                                       fontSize: 14.sp,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                 ],
                                          //                                               ),
                                          //                                             ),
                                          //                                           ],
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   });
                                          //                                 });
                                          //
                                          //                             // customerId = controller
                                          //                             //     .customerFilterList![
                                          //                             //         index]
                                          //                             //     .id
                                          //                             //     .toString();
                                          //                             // Get.to(
                                          //                             //     const FileListView());
                                          //                           },
                                          //                           child:
                                          //                               Row(
                                          //                                 children: [
                                          //                                   Icon(Icons.file_copy,color: Colors.white,size: 20,),
                                          //                                   SizedBox(width: 10.w,),
                                          //                                   CommonText(
                                          //                             text:
                                          //                                     "Assign Files",
                                          //                             fontColor:
                                          //                                     Colors
                                          //                                         .white,
                                          //                           ),
                                          //                                 ],
                                          //                               ),
                                          //                         ),
                                          //                         SizedBox(
                                          //                           height: 5.h,
                                          //                         ),
                                          //                         GestureDetector(
                                          //                             onTap:
                                          //                                 () {
                                          //                               controller
                                          //                                   .popupContoller[index]
                                          //                                   .hideMenu();
                                          //                               // Get.to(
                                          //                               //     const AddcustomerView(),
                                          //                               //     arguments:
                                          //                               //         controller.customerFilterList![index]);
                                          //                             },
                                          //                             child:
                                          //                                 Row(
                                          //                                   children: [
                                          //                                     Icon(Icons.edit,color: Colors.white,size: 20,),
                                          //                                     SizedBox(width: 10.w,),
                                          //                                     CommonText(
                                          //                               text:
                                          //                                       "Edit",
                                          //                               fontColor:
                                          //                                       Colors.white,
                                          //                             ),
                                          //                                   ],
                                          //                                 )),
                                          //                         SizedBox(
                                          //                           height: 5.h,
                                          //                         ),
                                          //                         GestureDetector(
                                          //                             onTap:
                                          //                                 () {},
                                          //                             child:
                                          //                                 Row(
                                          //                                   children: [
                                          //                                     Icon(Icons.delete,color: Colors.white,size: 20,),
                                          //                                     SizedBox(width: 10.w,),
                                          //                                     CommonText(
                                          //                               text:
                                          //                                       "Delete",
                                          //                               fontColor:
                                          //                                       Colors.white,
                                          //                             ),
                                          //                                   ],
                                          //                                 )),
                                          //
                                          //                         // CommonText(text: "Edit"),
                                          //                       ],
                                          //                     ),
                                          //                   ),
                                          //                 ),
                                          //                 child:
                                          //                     GestureDetector(
                                          //                         onTap: () {
                                          //                           controller
                                          //                               .popupContoller[
                                          //                                   index]
                                          //                               .showMenu();
                                          //                         },
                                          //                         child: const Icon(
                                          //                             Icons
                                          //                                 .more_vert)),
                                          //               ),
                                          //             ],
                                          //           ),
                                          //           Padding(
                                          //             padding: EdgeInsets.only(
                                          //                 left: 10.w,
                                          //                 right: 10.w,
                                          //                 top: 10.h,
                                          //                 bottom: 10.h),
                                          //             child: Row(
                                          //               mainAxisAlignment:
                                          //                   MainAxisAlignment
                                          //                       .spaceBetween,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       height: 50.h,
                                          //                       width: 50.h,
                                          //                       decoration: BoxDecoration(
                                          //                           borderRadius:
                                          //                               BorderRadius.circular(10
                                          //                                   .r),
                                          //                           color: ConstColor
                                          //                               .profileBackgroundColor),
                                          //                       child: Center(
                                          //                         child: Image
                                          //                             .asset(
                                          //                                 "assets/assets_svg/file.png"),
                                          //                       ),
                                          //                     ),
                                          //                     SizedBox(
                                          //                       width: 10.w,
                                          //                     ),
                                          //                     Column(
                                          //                       crossAxisAlignment:
                                          //                           CrossAxisAlignment
                                          //                               .start,
                                          //                       children: [
                                          //                         CommonText(
                                          //                           text:
                                          //                               "${controller.fileList[index].fileNo}",
                                          //                           maxLine: 1,
                                          //                           overflow:
                                          //                               TextOverflow
                                          //                                   .ellipsis,
                                          //                         ),
                                          //                         SizedBox(
                                          //                           width: 5.w,
                                          //                         ),
                                          //                         // Row(
                                          //                         //   children: [
                                          //                         //     // Icon(
                                          //                         //     //   Icons.timer_rounded,
                                          //                         //     //   size: 14.h,
                                          //                         //     //   color: ConstColor
                                          //                         //     //       .greyTextColor,
                                          //                         //     // ),
                                          //                         //     // SizedBox(
                                          //                         //     //   width: 5.w,
                                          //                         //     // ),
                                          //                         //     // CommonText(
                                          //                         //     //     text: 'Just now',
                                          //                         //     //     fontSize: 12.h,
                                          //                         //     //     fontColor: ConstColor
                                          //                         //     //         .greyTextColor),
                                          //                         //   ],
                                          //                         // )
                                          //                       ],
                                          //                     )
                                          //                   ],
                                          //                 ),
                                          //                 CommonText(
                                          //                     text: controller
                                          //                             .fileList[
                                          //                                 index]
                                          //                             .loanAmount ??
                                          //                         '',
                                          //                     fontSize: 12.h,
                                          //                     fontColor: ConstColor
                                          //                         .greyTextColor),
                                          //                 // Switch(
                                          //                 //     activeColor:
                                          //                 //         const Color(0xff0F9D3F),
                                          //                 //     value: controller.fileList[index]
                                          //                 //                 .status ==
                                          //                 //             'true'
                                          //                 //         ? true
                                          //                 //         : false,
                                          //                 //     onChanged: (val) {})
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ],
                                          //       )),
                                          // );
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
