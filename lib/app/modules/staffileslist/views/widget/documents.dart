// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/models/file_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentsView extends StatefulWidget {
  String fileId;
  DocumentsView({super.key, required this.fileId});

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  List<FileDetailsList> fileDetailsList = [];
  List<String> collectFileList = [];
  List<String> notCollectFileList = [];
  @override
  void initState() {
    super.initState();
    fileDetails();
  }

  fileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": widget.fileId,
    };
    print(jsonEncode(data));
    print(UrlUtils.showFileDocuments);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.showFileDocuments, data);
    if (finalData != null) {
      FileDetailsModel userData = FileDetailsModel.fromJson(finalData);
      if (userData.response != null) {
        fileDetailsList = userData.response!;
        for (int i = 0; i < fileDetailsList.length; i++) {
          if (fileDetailsList[i].isCollect != 'No') {
            collectFileList.add(fileDetailsList[i].documentName!);
          } else {
            notCollectFileList.add(fileDetailsList[i].documentName!);
          }
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: collectFileList.isNotEmpty || notCollectFileList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Padding(
                            padding: EdgeInsets.only(
                                bottom: 10.h, left: 15.w, right: 15.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: 'Collected Document',
                                      fontColor: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: collectFileList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(top: 5.h),
                                          child: Row(
                                            children: [
                                              CommonText(
                                                text: '${index + 1}. ',
                                                fontColor: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Expanded(
                                                child: CommonText(
                                                  text: collectFileList[index],
                                                  fontColor: Colors.black,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                bottom: 10.h, left: 15.w, right: 15.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: 'Not Collected Document',
                                      fontColor: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: notCollectFileList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(top: 5.h),
                                          child: Row(
                                            children: [
                                              CommonText(
                                                text: '${index + 1}. ',
                                                fontColor: Colors.red,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Expanded(
                                                child: CommonText(
                                                  text:
                                                      notCollectFileList[index],
                                                  fontColor: Colors.red,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                )
              : Center(
                  child: CommonText(text: 'No Document Collected.'),
                ),
        ),
      ],
    ));
  }
}
