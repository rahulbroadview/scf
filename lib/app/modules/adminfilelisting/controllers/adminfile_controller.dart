import 'dart:convert';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pay_day_manager/models/admin_file_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/file_model.dart';
import '../../../../models/stafflist_model.dart';
import '../../../core/them/const_color.dart';

class AdminFilelistController extends GetxController {
  List<AdminFileList> fileList = [];
  List<AdminFileList>? fileFilterList;
  bool refreshList = false;
  bool isLoder = false;
  List<CustomPopupMenuController> popupContoller = [];
  StaffList? selectedStaffLit;
  final searchController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final popupFormKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? selectedDate1;
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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fileListApi();
  }

  fileListApi() async {
    isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "page_no": "1",
    };
    print(jsonEncode(data));
    print(UrlUtils.allFilesList);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.allFilesList, data);
    if (finalData != null) {
      AdminFileListModel userData = AdminFileListModel.fromJson(finalData);
      if (userData.response != null) {
        fileList = userData.response!;
        print("------${fileList.length}");
      }
      isLoder = false;
    } else {
      isLoder = false;
    }
    update();
  }

  selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : DateTime(2020),
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
      selectedDate = newSelectedDate;
      fromDateController
        ..text = DateFormat('dd-MM-yyyy').format(selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: fromDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  selectDate1(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : DateTime(2020),
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
      selectedDate1 = newSelectedDate;
      if (selectedDate1!.isBefore(selectedDate!)) {
        Get.rawSnackbar(
            message: "To Date is always greater than from date.",
            backgroundColor: ConstColor.errorColor);
      } else {
        toDateController
          ..text = DateFormat('dd-MM-yyyy').format(selectedDate1!)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: fromDateController.text.length,
              affinity: TextAffinity.upstream));
      }
    }
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
                .contains(searchText!.toLowerCase()) ||
            product.viewUser!.lastName
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()))
        .toList();
    update();
  }

  navigateToDashboardView() async {
    Get.offAll(const DashboardView());
  }

  dateFilter() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "login_id": id,
      "token": token,
      if (fromDateController.text.isNotEmpty)
        "from_date": fromDateController.text.trim(),
      if (toDateController.text.isNotEmpty)
        "to_date": toDateController.text.trim(),
      if (selectedFileStatus != null) "file_status": selectedFileStatus
    };

    print(jsonEncode(data));
    var finalData = await APIServices.postWithDioForlogin(
      UrlUtils.fileFilterList,
      data,
    );
    print("----finalData----$finalData");
    if (finalData != null) {
      AdminFileListModel userData = AdminFileListModel.fromJson(finalData);
      if (userData.response != null) {
        fileFilterList = userData.response!;
        print("------${fileFilterList!.length}");
      }
      isLoder = false;
    }
    update();
  }
}
