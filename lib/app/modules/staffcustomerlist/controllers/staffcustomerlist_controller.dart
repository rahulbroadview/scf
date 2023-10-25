import 'dart:convert';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/models/staff_customerwise_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaffCustomerListController extends GetxController {
  List<StaffCustomerList> customerList = [];
  List<StaffCustomerList>? staffFilterList;
  bool refreshList = false;
  final searchController = TextEditingController();
  List<CustomPopupMenuController> popupContoller = [];
  final popupFormKey = GlobalKey<FormState>();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  DateTime? selectedDate;
  DateTime? selectedDate1;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    staffListApi();
  }

  staffListApi() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "staff_id": id, "page_no": "1", "login_id": id};
    print(jsonEncode(data));
    print(UrlUtils.staffWiseCustomerList);
    var finalData = await APIServices.postWithDioForlogin(
        UrlUtils.staffWiseCustomerList, data);
    print("========");
    print(finalData);
    if (finalData != null) {
      StaffWiseCustomerListModel userData =
          StaffWiseCustomerListModel.fromJson(finalData);
      if (userData.response != null) {
        customerList = userData.response!;
        for (int i = 0; i < customerList.length; i++) {
          popupContoller.add(CustomPopupMenuController());
        }
      }
    }
    update();
  }

  staffFilter({String? searchText}) async {
    if (searchController.text.isEmpty) {
      staffFilterList = null;
    }
    staffFilterList = customerList
        .where((product) =>
            product.firstName!
                .toString()
                .toLowerCase()
                .contains(searchText!.toLowerCase()) ||
            product.lastName!
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()))
        .toList();
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

  dateFilter() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "login_id": id,
      "token": token,
      "from_date": fromDateController.text.trim(),
      "to_date": toDateController.text.trim(),
    };
    var finalData = await APIServices.postWithDioForlogin(
      UrlUtils.staffWiseCustomerList,
      data,
    );
    if (finalData != null) {
      StaffWiseCustomerListModel userData =
          StaffWiseCustomerListModel.fromJson(finalData);
      if (userData.response != null) {
        staffFilterList = userData.response!;
        for (int i = 0; i < staffFilterList!.length; i++) {
          popupContoller.add(CustomPopupMenuController());
        }
      }
    }
    update();
  }
}
