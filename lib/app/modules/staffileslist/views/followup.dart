import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';
import '../../../core/them/const_color.dart';
import '../controllers/staaflist_controller.dart';

class FollowUpView extends GetView<StaffFileListController> {
  const FollowUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(StaffFileListController());
    return GetBuilder<StaffFileListController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: controller.followupKey,
              child: Column(
                children: [
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
                                    text: 'Follow Up',
                                    fontSize: 16.r,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CommonTextFormField(
                            controller: controller.remindDateController,
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Reminder Date",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter reminder date";
                              } else {
                                return null;
                              }
                            },
                            isReadOnly: true,
                            onTap: () {
                              controller.selectDate(context);
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CommonTextFormField(
                            controller: controller.remarksController,
                            maxLines: 4,
                            fillColor: Colors.white,
                            borderColor: Colors.white,
                            hintText: "Remarks",
                          ),
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
                                        text: 'Add Follow up',
                                        onPressed: () {
                                          if (controller
                                              .followupKey.currentState!
                                              .validate()) {
                                            controller.updateFileFollowup(
                                                fileId: controller.lonFileId);
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
