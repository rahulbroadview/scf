import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/modules/myprofile/controllers/upload_Image_service.dart';
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
  final ImagePicker picker = ImagePicker();
  File? customerImage;
  String? imageName;
  String birtDate = '';

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  imageUpload() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    customerImage = File(image!.path);
    imageName = customerImage!.path.split('/').last;
    update();
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
          if (profileDetails[0].profileImage != null) {
            imageName =
                "https://www.scfinvestmentgroup.com/public/upload/user_image/${profileDetails[0].profileImage}";
          }
          if (profileDetails[0].userProfile != null) {
            address1eController.text =
                profileDetails[0].userProfile!.address1 ?? '';
            address1eController.text =
                profileDetails[0].userProfile!.address2 ?? '';
            birthController.text =
                profileDetails[0].userProfile!.birthdate != null
                    ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                        profileDetails[0].userProfile!.birthdate.toString()))
                    : '';

            // profileDetails[0].userProfile!.birthdate ?? '';
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
      birtDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
      birthController
        ..text = DateFormat('dd-MM-yyyy').format(selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  updateProfile() async {
    //   final prefs = await SharedPreferences.getInstance();
    //   String token = prefs.getString('token') ?? '';
    //   String id = prefs.getString('id') ?? '';
    //   Map data2 = {
    //     "id": id,
    //     'user_type': 'staff',
    //     'first_name': firstNameController.text.trim(),
    //     'last_name': lastNameController.text.trim(),
    //     'mobile_no': phoneNumberController.text.trim(),
    //     'user_email': emailController.text.trim(),
    //     'birth_date': birthController.text.trim(),
    //     'address1': address1eController.text.trim(),
    //     'address2': address2Controller.text.trim(),
    //     'alt_mobile_no': '',
    //     'shift_start_time': '',
    //     'shift_end_time': '',
    //     'has_vehicle': '',
    //     'login_id': id,
    //     'token': token
    //   };

    //   print(jsonEncode(data2));
    //   var finalData =
    //       await APIServices.postWithDioForlogin(UrlUtils.updateUser, data2);
    //   if (finalData != null) {
    //     print("=====$finalData");
    //     return finalData;
    //   }
    // }

    var response = await ProfileImageUpload.imageUploadService(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        mobile: phoneNumberController.text.trim(),
        address1: address1eController.text.trim(),
        address2: address2Controller.text.trim(),
        profileImage: customerImage,
        birthDate: birtDate);
    if (response != null) {
      imageName = '';
      firstNameController.clear();
      lastNameController.clear();
      phoneNumberController.clear();
      emailController.clear();
      address1eController.clear();
      address2Controller.clear();
      birthController.clear();
      Get.back();
    }
  }
}
