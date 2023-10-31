import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/filelisting/views/filelisting_view.dart';
import '../../../../main.dart';
import '../../../alert_dialogs/common_dialog_header.dart';
import '../../addcustomer/views/addcustomer_view.dart';
import '../controllers/customerlisting_controller.dart';

class CustomerlistingView extends GetView<CustomerlistingController> {
  const CustomerlistingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CustomerlistingController());
    return GetBuilder<CustomerlistingController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const AddcustomerView())!
                  .then((value) => controller.customerListApi());
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
                                text: 'Customer',
                                fontSize: 16.r,
                              )
                            ],
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.to(const AddcustomerView())!.then(
                          //         (value) => controller.customerListApi());
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
                              hintText: "Search by customer",
                              onChanged: (value) {
                                controller.customerFilter(
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
                                                            width: Get.width,
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
                                                              text: 'Apply',
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
                          height: 15.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         CommonText(
                        //           fontSize: 12.h,
                        //           text: 'Category',
                        //           fontColor: ConstColor.textColor,
                        //         ),
                        //         const Icon(Icons.arrow_drop_down)
                        //       ],
                        //     )
                        //   ],
                        // ),
                        controller.customerFilterList != null
                            ? Expanded(
                                child: ListView.builder(
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                itemCount:
                                    controller.customerFilterList!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: GestureDetector(
                                      onTap: () {
                                        customerId = controller
                                            .customerFilterList![index].id
                                            .toString();
                                        print("@@@@@@");
                                        print(
                                            "${controller.customerFilterList![index].firstName.toString().capitalize} ${controller.customerFilterList![index].lastName.toString().capitalize}");
                                        Get.to(const FileListView(),
                                            arguments:
                                                "${controller.customerFilterList![index].firstName.toString().capitalize} ${controller.customerFilterList![index].lastName.toString().capitalize}");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.h,
                                                        left: 10.w,
                                                        top: 10),
                                                    child: Row(
                                                      children: [
                                                        CachedNetworkImage(
                                                          imageUrl:
                                                              "https://www.scfinvestmentgroup.com/public/upload/user_image/${controller.customerFilterList![index].profileImage}",
                                                          height: 80.h,
                                                          width: 80.h,
                                                          fit: BoxFit.fitHeight,
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            width: 80.h,
                                                            height: 80.h,
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
                                                          errorWidget: (context,
                                                                  url, error) =>
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
                                                                    "${controller.customerFilterList![index].firstName.toString().capitalize} ${controller.customerFilterList![index].lastName.toString().capitalize}"),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.call,
                                                                  size: 18.h,
                                                                  color: ConstColor
                                                                      .greyTextColor,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                CommonText(
                                                                    text: controller
                                                                            .customerFilterList![
                                                                                index]
                                                                            .mobileNo ??
                                                                        '',
                                                                    fontSize:
                                                                        14.h,
                                                                    fontColor:
                                                                        ConstColor
                                                                            .greyTextColor),
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Icon(Icons.chevron_right),
                                                  Row(
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
                                                          width: 150.w,
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
                                                                    customerId = controller
                                                                        .customerFilterList![
                                                                            index]
                                                                        .id
                                                                        .toString();
                                                                    Get.to(
                                                                        const FileListView(),
                                                                        arguments:
                                                                            "${controller.customerFilterList![index].firstName.toString().capitalize} ${controller.customerFilterList![index].lastName.toString().capitalize}");
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .add,
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
                                                                            "Add Files",
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
                                                                      Get.to(const AddcustomerView(),
                                                                              arguments: controller.customerFilterList![
                                                                                  index])!
                                                                          .then((value) =>
                                                                              controller.customerListApi());
                                                                    },
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .edit,
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
                                                                                      text: 'Are you sure you want to delete this customer?',
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
                                                                                                controller.customerDelete(id: controller.customerFilterList![index].id.toString());
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
                                                                                                // Get.back();
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
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  );
                                },
                              ))
                            : Expanded(
                                child: controller.customerList.isEmpty
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 100.h,
                                          ),
                                          CommonText(
                                            text: "No Data Found",
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                          )
                                        ],
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        controller: controller.scrollController,
                                        itemCount:
                                            controller.customerList.length,
                                        itemBuilder: (context, index) {
                                          print(
                                              'https://www.scfinvestmentgroup.com/public/upload/user_image/${controller.customerList[index].profileImage}');
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.h),
                                            child: GestureDetector(
                                              onTap: () {
                                                customerId = controller
                                                    .customerList[index].id
                                                    .toString();
                                                print("@@@@@@");
                                                print(
                                                    "${controller.customerList[index].firstName.toString().capitalize} ${controller.customerList[index].lastName.toString().capitalize}");
                                                Get.to(const FileListView(),
                                                    arguments:
                                                        "${controller.customerList[index].firstName.toString().capitalize} ${controller.customerList[index].lastName.toString().capitalize}");
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Colors.white),
                                                  child: Column(
                                                    children: [
                                                      // Row(
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment
                                                      //           .end,
                                                      //   children: [
                                                      //     CustomPopupMenu(
                                                      //       arrowSize: 0,
                                                      //       horizontalMargin:
                                                      //           10,
                                                      //       verticalMargin: 0,
                                                      //       pressType: PressType
                                                      //           .singleClick,
                                                      //       controller: controller
                                                      //               .popupContoller[
                                                      //           index],
                                                      //       menuBuilder: () =>
                                                      //           Container(
                                                      //         height: 100.h,
                                                      //         width: 150.w,
                                                      //         decoration: BoxDecoration(
                                                      //             color: ConstColor
                                                      //                 .color1E3F84,
                                                      //             borderRadius:
                                                      //                 BorderRadius.all(
                                                      //                     Radius.circular(
                                                      //                         10.r)),
                                                      //             boxShadow: const [
                                                      //               BoxShadow(
                                                      //                 color: Colors
                                                      //                     .grey,
                                                      //                 blurRadius:
                                                      //                     5.0,
                                                      //               ),
                                                      //             ]),
                                                      //         child: Padding(
                                                      //           padding:
                                                      //               const EdgeInsets
                                                      //                   .all(
                                                      //                   8.0),
                                                      //           child: Column(
                                                      //             crossAxisAlignment:
                                                      //                 CrossAxisAlignment
                                                      //                     .start,
                                                      //             children: [
                                                      //               GestureDetector(
                                                      //                 onTap:
                                                      //                     () {
                                                      //                   controller
                                                      //                       .popupContoller[index]
                                                      //                       .hideMenu();
                                                      //                   customerId = controller
                                                      //                       .customerList[index]
                                                      //                       .id
                                                      //                       .toString();
                                                      //                   print(
                                                      //                       "@@@@@@");
                                                      //                   print(
                                                      //                       "${controller.customerList[index].firstName} ${controller.customerList[index].lastName}");
                                                      //                   Get.to(
                                                      //                       const FileListView(),
                                                      //                       arguments: "${controller.customerList[index].firstName} ${controller.customerList[index].lastName}");
                                                      //                 },
                                                      //                 child:
                                                      //                     Row(
                                                      //                       children: [
                                                      //                         Icon(Icons.add,color: Colors.white,size: 20,),
                                                      //                         SizedBox(width: 10.w,),
                                                      //                         CommonText(
                                                      //                   text:
                                                      //                           "Add Files",
                                                      //                   fontColor:
                                                      //                           Colors.white,
                                                      //                 ),
                                                      //                       ],
                                                      //                     ),
                                                      //               ),
                                                      //               SizedBox(
                                                      //                 height:
                                                      //                     5.h,
                                                      //               ),
                                                      //               GestureDetector(
                                                      //                   onTap:
                                                      //                       () {
                                                      //                     controller.popupContoller[index].hideMenu();
                                                      //                     Get.to(const AddcustomerView(), arguments: controller.customerList[index])!.then((value) =>
                                                      //                         controller.customerListApi());
                                                      //                   },
                                                      //                   child:
                                                      //                       Row(
                                                      //                         children: [
                                                      //                           Icon(Icons.edit,color: Colors.white,size: 20,),
                                                      //                           SizedBox(width: 10.w,),
                                                      //                           CommonText(
                                                      //                     text:
                                                      //                             "Edit",
                                                      //                     fontColor:
                                                      //                             Colors.white,
                                                      //                   ),
                                                      //                         ],
                                                      //                       )),
                                                      //               SizedBox(
                                                      //                 height:
                                                      //                     5.h,
                                                      //               ),
                                                      //               GestureDetector(
                                                      //                   onTap:
                                                      //                       () {
                                                      //                     controller.popupContoller[index].hideMenu();
                                                      //                     showDialog(
                                                      //                         context: context,
                                                      //                         barrierDismissible: false,
                                                      //                         barrierColor: ConstColor.textColor.withOpacity(0.2),
                                                      //                         builder: (context) {
                                                      //                           return CommonDialogHeader(
                                                      //                             title: "Confirmation",
                                                      //                             bgColor: Colors.white,
                                                      //                             child: Padding(
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

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.h,
                                                                    left: 10.w,
                                                                    top: 10),
                                                            child: Row(
                                                              children: [
                                                                CachedNetworkImage(
                                                                  imageUrl:
                                                                      "https://www.scfinvestmentgroup.com/public/upload/user_image/${controller.customerList[index].profileImage}",
                                                                  height: 80.h,
                                                                  width: 80.h,

                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    width: 80.h,
                                                                    height:
                                                                        80.h,
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
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Container(
                                                                    height:
                                                                        50.h,
                                                                    width: 50.h,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10
                                                                                .r),
                                                                        color: ConstColor
                                                                            .profileBackgroundColor),
                                                                    child:
                                                                        Center(
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
                                                                            "${controller.customerList[index].firstName.toString().capitalize} ${controller.customerList[index].lastName.toString().capitalize}"),
                                                                    SizedBox(
                                                                      width:
                                                                          5.w,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .call,
                                                                          size:
                                                                              18.h,
                                                                          color:
                                                                              ConstColor.greyTextColor,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5.w,
                                                                        ),
                                                                        CommonText(
                                                                            text: controller.customerList[index].mobileNo ??
                                                                                '',
                                                                            fontSize:
                                                                                14.h,
                                                                            fontColor: ConstColor.greyTextColor),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Icon(Icons
                                                              .chevron_right),
                                                          Row(
                                                            children: [
                                                              CustomPopupMenu(
                                                                arrowSize: 0,
                                                                horizontalMargin:
                                                                    10,
                                                                verticalMargin:
                                                                    0,
                                                                pressType: PressType
                                                                    .singleClick,
                                                                controller:
                                                                    controller
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
                                                                              Radius.circular(10.r)),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.grey,
                                                                          blurRadius:
                                                                              5.0,
                                                                        ),
                                                                      ]),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            controller.popupContoller[index].hideMenu();
                                                                            customerId =
                                                                                controller.customerList[index].id.toString();
                                                                            print("@@@@@@");
                                                                            print("${controller.customerList[index].firstName} ${controller.customerList[index].lastName}");
                                                                            Get.to(const FileListView(),
                                                                                arguments: "${controller.customerList[index].firstName.toString().capitalize} ${controller.customerList[index].lastName.toString().capitalize}");
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.add,
                                                                                color: Colors.white,
                                                                                size: 20,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10.w,
                                                                              ),
                                                                              CommonText(
                                                                                text: "Add Files",
                                                                                fontColor: Colors.white,
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
                                                                              controller.popupContoller[index].hideMenu();
                                                                              Get.to(const AddcustomerView(), arguments: controller.customerList[index])!.then((value) => controller.customerListApi());
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.edit,
                                                                                  color: Colors.white,
                                                                                  size: 20,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10.w,
                                                                                ),
                                                                                CommonText(
                                                                                  text: "Edit",
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
                                                                              controller.popupContoller[index].hideMenu();
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
                                                                                              text: 'Are you sure you want to delete this customer?',
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
                                                                                                        controller.customerDelete(id: controller.customerList[index].id.toString());
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
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .popupContoller[index]
                                                                              .showMenu();
                                                                        },
                                                                        child: const Icon(
                                                                            Icons.more_vert)),
                                                              ),
                                                            ],
                                                          ),
                                                          // Expanded(
                                                          //     flex: 2,
                                                          //     child: Container(
                                                          //       decoration: BoxDecoration(
                                                          //           color:
                                                          //               const Color(0xffDAE2E9),
                                                          //           borderRadius:
                                                          //               BorderRadius.only(
                                                          //                   topRight:
                                                          //                       Radius.circular(
                                                          //                           10.r),
                                                          //                   bottomRight: Radius
                                                          //                       .circular(
                                                          //                           10.r))),
                                                          //       child: Column(
                                                          //         children: [
                                                          //           SizedBox(
                                                          //             height: 5.h,
                                                          //           ),
                                                          //           Row(
                                                          //             children: [
                                                          //               SizedBox(
                                                          //                 width: 10.w,
                                                          //               ),
                                                          //               Container(
                                                          //                 height: 35.h,
                                                          //                 width: 35.h,
                                                          //                 decoration: BoxDecoration(
                                                          //                     borderRadius:
                                                          //                         BorderRadius
                                                          //                             .circular(
                                                          //                                 5.r),
                                                          //                     color: ConstColor
                                                          //                         .buttonColor),
                                                          //                 child: const Center(
                                                          //                     child: Icon(
                                                          //                   Icons.visibility,
                                                          //                   color: Colors.white,
                                                          //                 )),
                                                          //               ),
                                                          //               SizedBox(
                                                          //                 width: 10.w,
                                                          //               ),
                                                          //               GestureDetector(
                                                          //                 onTap: () {
                                                          //                   customerId =
                                                          //                       controller
                                                          //                           .customerList[
                                                          //                               index]
                                                          //                           .id
                                                          //                           .toString();
                                                          //                   Get.to(
                                                          //                       const FileListView());
                                                          //                 },
                                                          //                 child: Container(
                                                          //                   height: 35.h,
                                                          //                   width: 35.h,
                                                          //                   decoration: BoxDecoration(
                                                          //                       borderRadius:
                                                          //                           BorderRadius
                                                          //                               .circular(5
                                                          //                                   .r),
                                                          //                       color: ConstColor
                                                          //                           .textColor),
                                                          //                   child: const Center(
                                                          //                     child: Icon(
                                                          //                       Icons.add,
                                                          //                       color: Colors
                                                          //                           .white,
                                                          //                     ),
                                                          //                   ),
                                                          //                 ),
                                                          //               ),
                                                          //               SizedBox(
                                                          //                 width: 10.w,
                                                          //               ),
                                                          //             ],
                                                          //           ),
                                                          //           SizedBox(
                                                          //             height: 10.h,
                                                          //           ),
                                                          //           Row(
                                                          //             children: [
                                                          //               SizedBox(
                                                          //                 width: 10.w,
                                                          //               ),
                                                          //               Container(
                                                          //                 height: 35.h,
                                                          //                 width: 35.h,
                                                          //                 decoration: BoxDecoration(
                                                          //                     borderRadius:
                                                          //                         BorderRadius
                                                          //                             .circular(
                                                          //                                 5.r),
                                                          //                     color: ConstColor
                                                          //                         .textColor),
                                                          //                 child: const Center(
                                                          //                   child: Icon(
                                                          //                     Icons.edit,
                                                          //                     color:
                                                          //                         Colors.white,
                                                          //                   ),
                                                          //                 ),
                                                          //               ),
                                                          //               SizedBox(
                                                          //                 width: 10.w,
                                                          //               ),
                                                          //               Container(
                                                          //                 height: 35.h,
                                                          //                 width: 35.h,
                                                          //                 decoration: BoxDecoration(
                                                          //                     borderRadius:
                                                          //                         BorderRadius
                                                          //                             .circular(
                                                          //                                 10.r),
                                                          //                     color: ConstColor
                                                          //                         .buttonColor),
                                                          //                 child: const Center(
                                                          //                   child: Icon(
                                                          //                     Icons.delete,
                                                          //                     color:
                                                          //                         Colors.white,
                                                          //                   ),
                                                          //                 ),
                                                          //               ),
                                                          //               SizedBox(
                                                          //                 width: 10.w,
                                                          //               ),
                                                          //             ],
                                                          //           ),
                                                          //           SizedBox(
                                                          //             height: 5.h,
                                                          //           ),
                                                          //         ],
                                                          //       ),
                                                          //     ))
                                                          // Column(
                                                          //   children: [
                                                          //     SvgPicture.asset(
                                                          //       "assets/assets_svg/document.svg",
                                                          //       color: (index + 1) % 2 == 0
                                                          //           ? Colors.red
                                                          //           : Colors.green,
                                                          //     ),
                                                          //     SizedBox(
                                                          //       height: 7.h,
                                                          //     ),
                                                          //     CommonText(
                                                          //       text: (index + 1) % 2 == 0
                                                          //           ? 'Pending'
                                                          //           : "Approved",
                                                          //       fontSize: 12.h,
                                                          //       fontColor:
                                                          //           ConstColor.greyTextColor,
                                                          //     )
                                                          //   ],
                                                          // )
                                                        ],
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
      );
    });
  }
}
