import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/profile_list_model.dart';
import '../../../config/url_utils.dart';
import '../../../core/them/const_color.dart';
import '../../../data/services/api_services.dart';

class MyprofileController extends GetxController {
  final count = 0.obs;
  List<ProfileResponse> profileDetails = [];
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final address1eController = TextEditingController();
  final address2Controller = TextEditingController();
  final birthController = TextEditingController();
  final addcustomerKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {"token": token, "id": id, "login_id": id};
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.myProfileUrl, data);
    if (finalData != null) {
      ProfileModel userData = ProfileModel.fromJson(finalData);
      if (userData.response != null) {
        profileDetails = userData.response!;
        if (profileDetails.isNotEmpty) {
          firstNameController.text = profileDetails[0].firstName ?? '';
          lastNameController.text = profileDetails[0].lastName ?? '';
          emailController.text = profileDetails[0].userEmail ?? '';
          phoneNumberController.text = profileDetails[0].mobileNo ?? '';
          if (profileDetails[0].userProfile != null) {
            address1eController.text =
                profileDetails[0].userProfile!.address1 ?? '';
            address1eController.text =
                profileDetails[0].userProfile!.address2 ?? '';
          }
        }
      }
    }
    update();
  }

  selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : DateTime(1990),
        firstDate: DateTime(1990),
        lastDate: DateTime(2023),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
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
      birthController
        ..text = DateFormat('dd-MM-yyyy').format(selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  updateProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data2 = {
      "id": id,
      'user_type': 'staff',
      'first_name': firstNameController.text.trim(),
      'last_name': lastNameController.text.trim(),
      'mobile_no': phoneNumberController.text.trim(),
      'user_email': emailController.text.trim(),
      'birth_date': birthController.text.trim(),
      'address1': address1eController.text.trim(),
      'address2': address2Controller.text.trim(),
      'alt_mobile_no': '',
      'shift_start_time': '',
      'shift_end_time': '',
      'has_vehicle': '',
      'login_id': id,
      'token': token
    };

    print(jsonEncode(data2));
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.updateUser, data2);
    if (finalData != null) {
      print("=====$finalData");
      return finalData;
    }
  }
}
