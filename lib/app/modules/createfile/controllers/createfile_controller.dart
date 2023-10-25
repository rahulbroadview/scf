import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../main.dart';
import '../../../../models/loan_type_model.dart';
import '../../../config/url_utils.dart';
import '../../../data/services/api_services.dart';

class CreateFileController extends GetxController {
  String? customerNameFrom = Get.arguments;
  final customerName = TextEditingController();
  final bankController = TextEditingController();
  final loanAmount = TextEditingController();
  final staffKey = GlobalKey<FormState>();
  bool hasVehicle = false;
  File? customerImage;
  String? imageName;
  final ImagePicker picker = ImagePicker();

  List<LoanTypeList> loanList = [];
  LoanTypeList? selectedLoanType;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loanListingApi();
  }

  loanListingApi() async {
    if (customerNameFrom != null) {
      customerName.text = customerNameFrom ?? '';
    }
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id};
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.loanListUrl, data);
    if (finalData != null) {
      LoanTypeModel userData = LoanTypeModel.fromJson(finalData);
      if (userData.response != null) {
        loanList = userData.response!;
      }
      print(loanList.length);
    }
    update();
  }

  imageUpload() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    customerImage = File(image!.path);
    imageName = customerImage!.path.split('/').last;
    update();
  }

  addFileListApi() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "customer_id": customerId,
      "loan_category_id": selectedLoanType!.id.toString(),
      "bank_name": bankController.text.trim(),
      "loan_amount": loanAmount.text.trim(),
      "loan_fees": "1000",
      "file_status": "Application Submitted",
      "document_name": "Adhar card, Pancard",
      "is_collect": "Yes",
      "remarks": customerName.text.trim(),
      "by_user_id": "2",
      "login_id": id,
      "token": token
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.createFileUrl, data);
    if (finalData != null) {
      Get.back();
      // FileListModel userData = FileListModel.fromJson(finalData);
      // if (userData.response != null) {
      //   fileList = userData.response!;
      // }
    }
    update();
  }

  void increment() => count.value++;
}
