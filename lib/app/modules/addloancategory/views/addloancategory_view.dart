import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../models/loan_type_model.dart';
import '../../../common_widgets/common_elevated_button.dart';
import '../../../common_widgets/common_text.dart';
import '../../../common_widgets/common_text_formfield.dart';
import '../../../core/them/const_color.dart';
import '../controllers/addloancategory_controller.dart';

class AddLoanCategoryView extends GetView<AddLoanCategoryController> {
  const AddLoanCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AddLoanCategoryController());
    return GetBuilder<AddLoanCategoryController>(builder: (controller) {
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
                                    text: 'Add Loan Category',
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
                          //   hintText: "Loan Name",
                          //   controller: controller.loanName,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter Category name";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: DropdownButtonHideUnderline(
                          //         child: DropdownButton2<LoanTypeList>(
                          //           isExpanded: true,
                          //           hint: Row(
                          //             children: [
                          //               Expanded(
                          //                 child: CommonText(
                          //                   text: 'Select Loan Type',
                          //                   fontSize: 12.r,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   fontColor: ConstColor.hintTextColor,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //           items: controller.loanList
                          //               .map(
                          //                 (item) =>
                          //                     DropdownMenuItem<LoanTypeList>(
                          //                   value: item,
                          //                   child: CommonText(
                          //                     text: item.loanType ?? '',
                          //                     fontSize: 16,
                          //                     overflow: TextOverflow.ellipsis,
                          //                   ),
                          //                 ),
                          //               )
                          //               .toList(),
                          //           value: controller.selectedLoanType,
                          //           onChanged: (LoanTypeList? newValue) {
                          //             controller.selectedLoanType = newValue;
                          //             controller.update();
                          //           },
                          //           icon: const Icon(Icons.keyboard_arrow_down),
                          //           iconEnabledColor: Colors.black,
                          //           buttonHeight: 50,
                          //           buttonWidth: Get.width,
                          //           buttonPadding: const EdgeInsets.only(
                          //               left: 10, right: 10),
                          //           buttonDecoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(10),
                          //             border: Border.all(
                          //                 color: Colors.white, width: 1),
                          //             color: Colors.white,
                          //           ),
                          //           itemHeight: 40,
                          //           dropdownMaxHeight: 200,
                          //           dropdownDecoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(10),
                          //             color: Colors.white,
                          //           ),
                          //           dropdownElevation: 3,
                          //           scrollbarRadius: const Radius.circular(10),
                          //           scrollbarThickness: 6,
                          //           scrollbarAlwaysShow: true,
                          //           offset: const Offset(10, 10),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CommonTextFormField(
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Category Name",
                            controller: controller.categoryName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter phone number";
                              } else {
                                return null;
                              }
                            },
                          ),
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
                            height: 15.h,
                          ),
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
                                        text: 'Add Loan Category',
                                        onPressed: () {
                                          if (controller.staffKey.currentState!
                                              .validate()) {
                                            controller.addFileListApi();
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
