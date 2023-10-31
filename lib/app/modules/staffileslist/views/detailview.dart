// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/widget/documents.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/widget/followuplist.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/widget/timeline.dart';

class FileDetailsView extends StatefulWidget {
  String fileId;
  FileDetailsView({super.key, required this.fileId});

  @override
  State<FileDetailsView> createState() => _FileDetailsViewState();
}

class _FileDetailsViewState extends State<FileDetailsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                'File Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.alarm,
                    color: Colors.black,
                  ),
                  child: Text(
                    "Time Line",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.follow_the_signs,
                    color: Colors.black,
                  ),
                  child: Text(
                    "Follow Up",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.file_copy,
                    color: Colors.black,
                  ),
                  child: Text(
                    "Documents",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TimeLineView(fileId: widget.fileId),
              FollowListView(fileId: widget.fileId),
              DocumentsView(fileId: widget.fileId),
            ],
          ),
        ),
      ),
    );
  }
}
