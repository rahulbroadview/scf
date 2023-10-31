// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/common_widgets/common_elevated_button.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/models/file_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/all_document_list_model.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/them/const_color.dart';

class CollectDocumentStaffView extends StatefulWidget {
  String fileId;
  String loanId;
  CollectDocumentStaffView(
      {super.key, required this.fileId, required this.loanId});

  @override
  State<CollectDocumentStaffView> createState() =>
      _CollectDocumentStaffViewState();
}

class _CollectDocumentStaffViewState extends State<CollectDocumentStaffView> {
  List<String> requireFileList = [
    "Pan card",
    "Adhar card",
    "Home light bill current month",
    "Salary bank account statement 1 year",
    "Salary slip 6 month",
    "Photos",
    "Bank account statement 1 year"
  ];
  List<FileDetailsList> fileDetailsList = [];
  List collectFileList = [];
  List notCollectFileList = [];
  final staffKey = GlobalKey<FormState>();
  List<AllDocumentList> documentList = [];
  bool isload = false;
  @override
  void initState() {
    super.initState();
    getDocumentList();
  }

  updateFileStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": widget.fileId,
      "collected_document_id": collectFileList.join(","),
    };
    print(jsonEncode(data));
    var finalData = await APIServices.postWithDioForlogin(
        UrlUtils.updateDocumentStatus, data);

    if (finalData != null) {
      print("------$finalData");
      Get.rawSnackbar(
          message: "Document status updated",
          backgroundColor: ConstColor.color009846);
      Navigator.pop(context);
      // Get.back();
    }
    setState(() {});
  }

  getDocumentList() async {
    isload = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": widget.fileId,
    };
    print(jsonEncode(data));
    print(UrlUtils.getAllDocumnets);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.getAllDocumnets, data);
    if (finalData != null) {
      AllDocumentListModel userData = AllDocumentListModel.fromJson(finalData);
      if (userData.response != null) {
        documentList = userData.response!;
      }
      for (int i = 0; i < documentList.length; i++) {
        if (documentList[i].isCollect == 'Yes') {
          collectFileList.add(documentList[i].id);
        } else {
          notCollectFileList.add(documentList[i].id);
        }
      }
      isload = false;
    } else {
      isload = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isload
            ? const SizedBox()
            : SingleChildScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                      CommonText(
                                        text: 'Update Documents',
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
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: documentList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (collectFileList
                                          .contains(documentList[index].id)) {
                                        collectFileList
                                            .remove(documentList[index].id);
                                      } else {
                                        collectFileList
                                            .add(documentList[index].id);
                                      }
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          collectFileList.contains(
                                                  documentList[index].id)
                                              ? Container(
                                                  height: 25.h,
                                                  width: 25.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ConstColor.buttonColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    // border:
                                                    //     Border.all(width: 1, color: Colors.black),
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 20.w,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : Container(
                                                  height: 25.h,
                                                  width: 25.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black)),
                                                ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: CommonText(
                                                text: documentList[index]
                                                        .documentName ??
                                                    ''),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
                                            bgColor: documentList.isNotEmpty
                                                ? ConstColor.buttonColor
                                                : Colors.grey.shade400,
                                            textColor: documentList.isNotEmpty
                                                ? Colors.white
                                                : Colors.black,
                                            text: 'Update Documents',
                                            onPressed: () {
                                              if (staffKey.currentState!
                                                  .validate()) {
                                                updateFileStatus();
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
