// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_formfield.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/models/file_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateFileStatusView extends StatefulWidget {
  String fileId;
  String fileStatus;
  String fileNumber;
  UpdateFileStatusView({
    super.key,
    required this.fileId,
    required this.fileStatus,
    required this.fileNumber,
  });

  @override
  State<UpdateFileStatusView> createState() => _UpdateFileStatusViewState();
}

class _UpdateFileStatusViewState extends State<UpdateFileStatusView> {
  List<String> requireFileList = [
    "Application Submitted",
    "Under Review",
    "Pending Documentation",
    "Approved",
    "Denied",
    "Withdrawn",
    "Sanctioned",
    "Funded",
    "Fees Collected",
    "Closed"
  ];
  String? selectedFileStatus;
  List<FileDetailsList> fileDetailsList = [];
  List<String> collectFileList = [];
  final staffKey = GlobalKey<FormState>();
  final remarksController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // fileDetails();
    getSelectedFile();
  }

  getSelectedFile() {
    for (int i = 0; i < requireFileList.length; i++) {
      if (requireFileList[i] == widget.fileStatus) {
        selectedFileStatus = requireFileList[i];
      } else {}
    }
    setState(() {});
  }

  fileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": widget.fileId,
      "file_status": selectedFileStatus ?? '',
      "remarks": remarksController.text.trim(),
      "file_no": widget.fileNumber,
    };
    print(jsonEncode(data));
    print(UrlUtils.updateFileStatus);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.updateFileStatus, data);
    if (finalData != null) {
      Get.back();
      // FileDetailsModel userData = FileDetailsModel.fromJson(finalData);
      // if (userData.response != null) {
      //   fileDetailsList = userData.response!;
      //   collectFileList = fileDetailsList[0].documentName.toString().split(",");
      //   // print(fileDetailsList[0].f);
      // }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: staffKey,
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
                                  text: 'Update File Status',
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
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: CommonText(
                                    text: 'Select Status',
                                    fontSize: 12.r,
                                    overflow: TextOverflow.ellipsis,
                                    fontColor: ConstColor.hintTextColor,
                                  ),
                                ),
                              ],
                            ),
                            items: requireFileList
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: CommonText(
                                      text: item,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                .toList(),
                            value: selectedFileStatus,
                            onChanged: (String? newValue) {
                              selectedFileStatus = newValue;
                              setState(() {});
                            },
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconEnabledColor: Colors.black,
                            buttonHeight: 50,
                            buttonWidth: Get.width,
                            buttonPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 1),
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
                        SizedBox(
                          height: 15.h,
                        ),
                        CommonTextFormField(
                          controller: remarksController,
                          maxLines: 4,
                          fillColor: Colors.white,
                          borderColor: Colors.white,
                          hintText: "Remarks",
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
                                      text: 'Update File Status',
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (staffKey.currentState!.validate()) {
                                          fileDetails();
                                          // controller.addFileListApi();
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
  }
}
