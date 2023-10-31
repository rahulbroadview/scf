import 'dart:convert';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/app/modules/staffDashboard/views/staffDashboard_view.dart';
import 'package:pay_day_manager/models/file_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/file_details.dart';
import '../../../core/them/const_color.dart';

class StaffFileListController extends GetxController {
  bool refreshList = false;
  final searchController = TextEditingController();
  List<CustomPopupMenuController> popupContoller = [];
  final staffKey = GlobalKey<FormState>();
  final remindDateController = TextEditingController();
  final remarksController = TextEditingController();
  final followupKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  List<FileList> fileList = [];
  List<FileList>? fileFilterList;
  // List<String> requireFileList = [
  //   "Pan card",
  //   "Adhar card",
  //   "Home light bill current month",
  //   "Salary bank account statement 1 year",
  //   "Salary slip 6 month",
  //   "Photos",
  //   "Bank account statement 1 year"
  // ];

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
  List<String> collectFileList = [];
  String lonFileId = "";
  List<FileDetailsList> fileDetailsList = [];
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  final popupFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fileListApi();
  }

  fileListApi() async {
    // isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "staff_id": id,
    };
    print(jsonEncode(data));
    print(UrlUtils.staffFileList);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.staffFileList, data);
    if (finalData != null) {
      FileListModel userData = FileListModel.fromJson(finalData);
      if (userData.response != null) {
        fileList = userData.response!;
      }
      for (int i = 0; i < fileList.length; i++) {
        popupContoller.add(CustomPopupMenuController());
      }
    }
    update();
  }

  staffFilter({String? searchText}) async {
    if (searchController.text.isEmpty) {
      fileFilterList = null;
    }
    fileFilterList = fileList
        .where((product) =>
            product.fileNo!
                .toString()
                .toLowerCase()
                .contains(searchText!.toLowerCase()) ||
            product.viewUser!.firstName
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            product.viewUser!.lastName
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()))
        .toList();
    for (int i = 0; i < fileFilterList!.length; i++) {
      popupContoller.add(CustomPopupMenuController());
    }
    update();
  }

  selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    currentDate = currentDate.add(const Duration(days: 1));
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : currentDate,
        firstDate: currentDate,
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                  primary: ConstColor.buttonColor,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: ConstColor.buttonColor),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      remindDateController
        ..text = DateFormat('dd-MM-yyyy').format(selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: remindDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  fileDetails({required String fileId}) async {
    print("-----Calling.....");
    // isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": fileId,
    };
    print(jsonEncode(data));
    print(UrlUtils.showFileDocuments);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.showFileDocuments, data);
    if (finalData != null) {
      FileDetailsModel userData = FileDetailsModel.fromJson(finalData);
      if (userData.response != null) {
        fileDetailsList = userData.response!;
        collectFileList = fileDetailsList[0].documentName.toString().split(",");
      }
    }
    update();
  }

  updateFileDocument({required String fileId}) async {
    // isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "document_id": collectFileList.join(", "),
      "is_collect": "No",
      "token": token,
      "login_id": id,
      "loan_file_id": fileId,
    };
    print(jsonEncode(data));
    print(UrlUtils.showFileDocuments);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.showFileDocuments, data);
    if (finalData != null) {
      FileDetailsModel userData = FileDetailsModel.fromJson(finalData);
      if (userData.response != null) {
        fileDetailsList = userData.response!;
        collectFileList = fileDetailsList[0].documentName.toString().split(",");
      }
    }
    update();
  }

  updateFileFollowup({required String fileId}) async {
    // isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "remind_date": remindDateController.text.trim(),
      "remarks": remarksController.text.trim(),
      "login_id": id,
      "loan_file_id": fileId,
    };
    print(jsonEncode(data));
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.addFileFollowUp, data);
    if (finalData != null) {
      remindDateController.clear();
      remarksController.clear();
      print("-----##------${finalData}");
      Get.back();
      // FileDetailsModel userData = FileDetailsModel.fromJson(finalData);
      // if (userData.response != null) {
      //   fileDetailsList = userData.response!;
      //   collectFileList = fileDetailsList[0].documentName.toString().split(",");
      // }
    }
    update();
  }

  selectDate1(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate1 != null ? selectedDate1! : DateTime(2020),
        firstDate: DateTime(2020),
        lastDate: DateTime(2028),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                  primary: ConstColor.buttonColor,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: ConstColor.buttonColor),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      selectedDate1 = newSelectedDate;
      fromDateController
        ..text = DateFormat('dd-MM-yyyy').format(selectedDate1!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: fromDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  selectDate2(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate2 != null ? selectedDate2! : DateTime(2020),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                  primary: ConstColor.buttonColor,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: ConstColor.buttonColor),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      selectedDate2 = newSelectedDate;
      if (selectedDate2!.isBefore(selectedDate1!)) {
        Get.rawSnackbar(
            message: "To Date is always greater than from date.",
            backgroundColor: ConstColor.errorColor);
      } else {
        toDateController
          ..text = DateFormat('dd-MM-yyyy').format(selectedDate2!)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: fromDateController.text.length,
              affinity: TextAffinity.upstream));
      }
    }
  }

  naviGateToDashboard() {
    Get.offAll(const StaffDashboardView());
  }

  dateFilter() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "login_id": id,
      "token": token,
      // "from_date": fromDateController.text.trim(),
      // "to_date": toDateController.text.trim(),
      if (fromDateController.text.isNotEmpty)
        "from_date": fromDateController.text.trim(),
      if (toDateController.text.isNotEmpty)
        "to_date": toDateController.text.trim(),
      if (selectedFileStatus != null) "file_status": selectedFileStatus
    };
    var finalData = await APIServices.postWithDioForlogin(
      UrlUtils.staffFileListFilter,
      data,
    );
    if (finalData != null) {
      FileListModel userData = FileListModel.fromJson(finalData);
      if (userData.response != null) {
        fileFilterList = userData.response!;
      }
      for (int i = 0; i < fileFilterList!.length; i++) {
        popupContoller.add(CustomPopupMenuController());
      }
    }
    update();
  }
}
