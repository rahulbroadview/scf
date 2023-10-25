import 'dart:convert';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/stafflist_model.dart';

class StaaflistController extends GetxController {
  List<StaffList> staffList = [];
  List<StaffList>? staffFilterList;
  bool refreshList = false;
  final searchController = TextEditingController();
  List<CustomPopupMenuController> popupContoller = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    staffListApi();
  }

  staffListApi() async {
    print("====######");
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id};
    print(UrlUtils.staffListUrl);
    print(jsonEncode(data));
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.staffListUrl, data);
    if (finalData != null) {
      StaffListModel userData = StaffListModel.fromJson(finalData);
      if (userData.response != null) {
        staffList = userData.response!;
        for (int i = 0; i < staffList.length; i++) {
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
    staffFilterList = staffList
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
}
