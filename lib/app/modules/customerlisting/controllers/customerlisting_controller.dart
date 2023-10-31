import 'dart:convert';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/customer_list_model.dart';
import '../../../config/url_utils.dart';
import '../../../core/them/const_color.dart';
import '../../../data/services/api_services.dart';

class CustomerlistingController extends GetxController {
  List<CustomerListing> customerList = [];
  List<CustomPopupMenuController> popupContoller = [];
  List<CustomerListing>? customerFilterList;
  final searchController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final popupFormKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? selectedDate1;
  ScrollController scrollController = ScrollController();

  final count = 0.obs;
  int page = 1;
  @override
  void onInit() {
    super.onInit();
    addItems();
    customerListApi();
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print("=========##");
        page = page + 1;
        customerListApi2();
      }
    });
  }

  Future<bool> loadMore() async {
    print("onLoadMore");
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    // load();
    return true;
  }

  customerListApi() async {
    page = 1;
    // customerList = [];
    // popupContoller = [];
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id, "page_no": page};
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.customerListUrl, data);
    if (finalData != null) {
      CustomerListModel userData = CustomerListModel.fromJson(finalData);
      if (userData.response != null) {
        customerList = userData.response!;
      }
      for (int i = 0; i < customerList.length; i++) {
        popupContoller.add(CustomPopupMenuController());
      }
    }
    print(customerList.length);
    update();
  }

  customerListApi2() async {
    print("=======11");
    List<CustomerListing> tempCustomerList = [];
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id, "page_no": page};
    var finalData = await APIServices.postWithDioForloginWithoutSearch(
        UrlUtils.customerListUrl, data);
    if (finalData != null) {
      CustomerListModel userData = CustomerListModel.fromJson(finalData);
      if (userData.response != null) {
        tempCustomerList = userData.response!;
      }
      if (tempCustomerList.isNotEmpty) {
        for (int i = 0; i < tempCustomerList.length; i++) {
          customerList.add(tempCustomerList[i]);
          popupContoller.add(CustomPopupMenuController());
        }
      } else {
        page = page - 1;
      }
    }
    update();
  }

  customerFilter({String? searchText}) async {
    if (searchController.text.isEmpty) {
      customerFilterList = null;
    }
    customerFilterList = customerList
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
      UrlUtils.customerFilter,
      data,
    );
    if (finalData != null) {
      CustomerListModel userData = CustomerListModel.fromJson(finalData);
      if (userData.response != null) {
        customerFilterList = userData.response!;
      }
    }
    update();
  }

  customerDelete({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id1 = prefs.getString('id') ?? '';
    Map data = {"id": id, "token": token, "login_id": id1};
    print(jsonEncode(data));
    print(UrlUtils.customerDelete);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.customerDelete, data);
    if (finalData != null) {
      // Get.back();
      Get.rawSnackbar(
          message: finalData['response'],
          backgroundColor: ConstColor.color009846);
      customerListApi();
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
}
