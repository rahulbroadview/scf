// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../models/follow_list.dart';
import '../../../../config/url_utils.dart';

class FollowListView extends StatefulWidget {
  String fileId;
  FollowListView({super.key, required this.fileId});

  @override
  State<FollowListView> createState() => _FollowListViewState();
}

class _FollowListViewState extends State<FollowListView> {
  List<FollowFileList> followList = [];
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
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.showFileFollowUp, data);
    if (finalData != null) {
      FollowUpModel userData = FollowUpModel.fromJson(finalData);
      if (userData.response != null) {
        followList = userData.response!;
        followList = List.from(followList.reversed);
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
          child: followList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: followList.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                text: 'Next Remind Date',
                                fontColor: Colors.grey,
                                fontSize: 12.sp,
                              ),
                              CommonText(
                                text: followList[index].remindDate ?? '',
                                fontColor: Colors.black,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CommonText(
                                text: 'Remarks',
                                fontColor: Colors.grey,
                                fontSize: 12.sp,
                              ),
                              CommonText(
                                text: followList[index].remarks ?? '',
                                fontColor: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CommonText(text: 'No Followup list.'),
                ),
        )
      ],
    ));
  }
}
