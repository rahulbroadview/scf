import 'dart:convert';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../../models/file_model.dart';
import '../../../../models/stafflist_model.dart';

class FilelistController extends GetxController {
  String? customerName = Get.arguments;
  List<FileList> fileList = [];
  bool refreshList = false;
  bool isLoder = false;
  List<CustomPopupMenuController> popupContoller = [];
  List<StaffList> staffList = [];
  StaffList? selectedStaffLit;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fileListApi();
  }

  fileListApi() async {
    print("###########");
    if (customerName != null) {
      print("-------${customerName}");
    }
    isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "page_no": "1",
      "customer_id": customerId
    };
    print(jsonEncode(data));
    var finalData = await APIServices.postWithDioForlogin(
        UrlUtils.customerFileListUrl, data);
    print(finalData);
    if (finalData != null) {
      FileListModel userData = FileListModel.fromJson(finalData);
      if (userData.response != null) {
        fileList = userData.response!;

        for (int i = 0; i < fileList.length; i++) {
          popupContoller.add(CustomPopupMenuController());
        }
      }
      isLoder = false;
    } else {
      isLoder = false;
    }
    staffListApi();
    update();
  }

  assignfileListApi({String? fileName, String? fileId}) async {
    // isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "loan_file_id": fileId,
      "file_no": fileName,
      "staff_id": selectedStaffLit!.id,
    };
    print(data);
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.assignFileToStaff, data);
    if (finalData != null) {
      print("----finalData---$finalData");
      Get.rawSnackbar(
          message:
              "File Assign to ${selectedStaffLit!.firstName} ${selectedStaffLit!.lastName}",
          backgroundColor: ConstColor.color009846);
      // FileListModel userData = FileListModel.fromJson(finalData);
      // if (userData.response != null) {
      //   fileList = userData.response!;

      //   for (int i = 0; i < fileList.length; i++) {
      //     popupContoller.add(CustomPopupMenuController());
      //   }
      // }
      // isLoder = false;
    }
    update();
  }

  staffListApi() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id};
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.staffListUrl, data);
    if (finalData != null) {
      StaffListModel userData = StaffListModel.fromJson(finalData);
      if (userData.response != null) {
        staffList = userData.response!;
      }
    }
    update();
  }
}
