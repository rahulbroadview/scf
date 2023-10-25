// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
            title: const Text(
              'File Details',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.timeline,
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
                    "FollowupList",
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
