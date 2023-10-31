import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/loan_type_model.dart';
import '../../../config/url_utils.dart';
import '../../../data/services/api_services.dart';

class AddLoanFilesController extends GetxController {
  final documentName = TextEditingController();
  final bankController = TextEditingController();
  final staffKey = GlobalKey<FormState>();
  bool hasVehicle = false;
  File? customerImage;
  String? imageName;
  final ImagePicker picker = ImagePicker();

  List<LoanTypeList> loanList = [];
  LoanTypeList? selectedLoanType;
  bool moreFile = false;
  List requireFileList = [];

  // List<String> requireFileList = [
  //   "Pan card",
  //   "Adhar card",
  //   "Home light bill current month",
  //   "Salary bank account statement 1 year",
  //   "Salary slip 6 month",
  //   "Photos",
  //   "Bank account statement 1 year"
  // ];
  List collectFileList = [];

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loanListingApi();
  }

  loanListingApi() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "login_id": id};
    print(jsonEncode(data));
    print(UrlUtils.loanListUrl);
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
      "loan_category_id": selectedLoanType!.id.toString(),
      "login_id": id,
      "token": token
    };
    var finalData = await APIServices.postWithDioForlogin(
        UrlUtils.listCategoryDocument, data);
    if (finalData != null) {
      requireFileList = finalData['response'];
    }
    update();
  }

  updateDocumentApi() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "loan_category_id": selectedLoanType!.id.toString(),
      "document_name": documentName.text.trim(),
      "login_id": id,
      "token": token
    };
    var finalData = await APIServices.postWithDioForlogin(
        UrlUtils.updateCategoryDcument, data);
    if (finalData != null) {
      // print("-----finalData-----$finalData");
      // Get.back();
      // FileListModel userData = FileListModel.fromJson(finalData);
      // if (userData.response != null) {
      //   fileList = userData.response!;
      // }
    }
    update();
  }

  void increment() => count.value++;
}
