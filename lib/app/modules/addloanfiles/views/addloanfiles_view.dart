import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';

import '../../../../models/loan_type_model.dart';
import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/them/const_color.dart';
import '../controllers/addloanfiles_controller.dart';

class AddLoanFilesView extends GetView<AddLoanFilesController> {
  const AddLoanFilesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AddLoanFilesController());
    return GetBuilder<AddLoanFilesController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: controller.staffKey,
              child: Column(
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
                                    text: 'Add Loan Documents',
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
                  Container(
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
                          // CommonTextFormField(
                          //   fillColor: Colors.white,
                          //   borderColor: Colors.white,
                          //   hintText: "Document Name",
                          //   controller: controller.documentName,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter first name";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<LoanTypeList>(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Expanded(
                                          child: CommonText(
                                            text: 'Select Loan Type',
                                            fontSize: 12.r,
                                            overflow: TextOverflow.ellipsis,
                                            fontColor: ConstColor.hintTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: controller.loanList
                                        .map(
                                          (item) =>
                                              DropdownMenuItem<LoanTypeList>(
                                            value: item,
                                            child: CommonText(
                                              text: item.categoryName ?? '',
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    value: controller.selectedLoanType,
                                    onChanged: (LoanTypeList? newValue) {
                                      controller.selectedLoanType = newValue;
                                      controller.addFileListApi();
                                      controller.update();
                                    },
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    iconEnabledColor: Colors.black,
                                    buttonHeight: 50,
                                    buttonWidth: Get.width,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white, width: 1),
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.requireFileList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (controller.collectFileList.contains(
                                      controller.requireFileList[index])) {
                                    controller.collectFileList.remove(
                                        controller.requireFileList[index]);
                                  } else {
                                    controller.collectFileList
                                        .add(controller.requireFileList[index]);
                                  }
                                  controller.update();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(text: "${index + 1}."),
                                      // controller.collectFileList.contains(
                                      //         controller.requireFileList[index])
                                      //     ? Container(
                                      //         height: 25.h,
                                      //         width: 25.h,
                                      //         decoration: BoxDecoration(
                                      //           color: ConstColor.buttonColor,
                                      //           borderRadius:
                                      //               BorderRadius.circular(4.r),
                                      //           // border:
                                      //           //     Border.all(width: 1, color: Colors.black),
                                      //         ),
                                      //         child: Icon(
                                      //           Icons.check,
                                      //           size: 20.w,
                                      //           color: Colors.white,
                                      //         ),
                                      //       )
                                      //     : Container(
                                      //         height: 25.h,
                                      //         width: 25.h,
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     4.r),
                                      //             border: Border.all(
                                      //                 width: 1,
                                      //                 color: Colors.black)),
                                      //       ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: CommonText(
                                            text: controller
                                                .requireFileList[index]),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          // CommonTextFormField(
                          //   fillColor: Colors.white,
                          //   borderColor: Colors.white,
                          //   hintText: "Bank Name",
                          //   controller: controller.bankController,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter phone number";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          // CommonTextFormField(
                          //   fillColor: Colors.white,
                          //   borderColor: Colors.white,
                          //   hintText: "Loan Amount",
                          //   controller: controller.loanAmount,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter password";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          // ),
                          SizedBox(
                            height: 20.h,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.moreFile = true;
                                  controller.update();
                                },
                                child: CommonText(
                                  text: "Add More  Documents",
                                  fontSize: 14.sp,
                                  fontColor: ConstColor.buttonColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              controller.moreFile
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.moreFile = false;
                                        controller.update();
                                      },
                                      child: CircleAvatar(
                                        radius: 15.r,
                                        backgroundColor: ConstColor.buttonColor,
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          controller.moreFile
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    CommonTextFormField(
                                      fillColor: Colors.white,
                                      borderColor: Colors.white,
                                      hintText: "Document Name",
                                      controller: controller.documentName,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter document name";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox(),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Center(
                                child: SizedBox(
                                    height: 50.h,
                                    width: 335.h,
                                    child: CommonElevatedButton(
                                        text: 'Add Loan Documents',
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          if (controller.staffKey.currentState!
                                              .validate()) {
                                            controller.updateDocumentApi();
                                            // controller.staffListApi();
                                          }
                                        })),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
