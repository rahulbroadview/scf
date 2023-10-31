// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/models/timeLine_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/services/api_services.dart';

class TimeLineView extends StatefulWidget {
  String fileId;
  TimeLineView({super.key, required this.fileId});

  @override
  State<TimeLineView> createState() => _TimeLineViewState();
}

class _TimeLineViewState extends State<TimeLineView> {
  List<String> collectFileList = [];
  bool isload = false;
  List<TimeLineList> timeList = [];
  @override
  void initState() {
    super.initState();
    fileDetails();
  }

  fileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    isload = true;
    setState(() {});
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": widget.fileId,
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.timeLineApi, data);
    if (finalData != null) {
      TimeLineModel data = TimeLineModel.fromJson(finalData);
      timeList = data.response!;
      print("-----${timeList.length}");
      isload = false;
      setState(() {});
    }
    isload = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: isload
            ? const SizedBox()
            : timeList.isEmpty
                ? Center(
                    child: CommonText(text: "No Data Found"),
                  )
                : SingleChildScrollView(
                    child: OrderTrackerZen(
                      tracker_data: [
                        for (int i = 0; i < timeList.length; i++)
                          TrackerData(
                            title: timeList[i].fileStatus ?? 'File Status',
                            date: "",
                            tracker_details: [
                              TrackerDetails(
                                title: timeList[i].remarks ?? '',
                                datetime: DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(
                                        timeList[i].createdAt.toString())),
                              ),
                              // TrackerDetails(
                              //   title: "Zenzzen Arranged A Callback Request",
                              //   datetime: "Sat, 8 Apr '22 - 17:42",
                              // ),
                            ],
                          ),

                        // yet another TrackerData object
                        // TrackerData(
                        //   title: "Order Shipped",
                        //   date: "Sat, 8 Apr '22",
                        //   tracker_details: [
                        //     TrackerDetails(
                        //       title: "Your order was shipped with MailDeli",
                        //       datetime: "Sat, 8 Apr '22 - 17:50",
                        //     ),
                        //   ],
                        // ),
                        // And yet another TrackerData object
                        // TrackerData(
                        //   title: "Order Delivered",
                        //   date: "Sat,8 Apr '22",
                        //   tracker_details: [
                        //     TrackerDetails(
                        //       title: "You received your order, by MailDeli",
                        //       datetime: "Sat, 8 Apr '22 - 17:51",
                        //     ),
                        //   ],
                        // ),

                        // TrackerData(
                        //   title: "Order Delivered",
                        //   date: "Sat,20 Apr '22",
                        //   tracker_details: [
                        //     TrackerDetails(
                        //       title: "You received your order, by MailDeli",
                        //       datetime: "Sat, 8 Apr '22 - 17:51",
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
