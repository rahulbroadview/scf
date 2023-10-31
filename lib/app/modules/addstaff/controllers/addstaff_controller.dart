import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/modules/addstaff/controllers/imga_service.dart';
import 'package:pay_day_manager/app/modules/staaflist/controllers/staaflist_controller.dart';

import '../../../../models/stafflist_model.dart';
import '../../../core/them/const_color.dart';

class AddstaffController extends GetxController {
  StaffList? staffData = Get.arguments;
  final firstNamecontroller = TextEditingController();
  final lastNamecontroller = TextEditingController();
  final mobileNamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPasswordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final birthdatecontroller = TextEditingController();
  final address1controller = TextEditingController();
  final address2controller = TextEditingController();
  final altmobilecontroller = TextEditingController();
  final shiftStartcontroller = TextEditingController();
  final shiftEndcontroller = TextEditingController();
  final address1eController = TextEditingController();
  final address2Controller = TextEditingController();
  final birthController = TextEditingController();
  String birthDate = '';
  final staffKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  bool hasVehicle = false;
  File? customerImage;
  String? imageName;
  final ImagePicker picker = ImagePicker();
  bool showPassword = true;
  bool confirmPassword = true;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (staffData != null) {
      setData();
    }
  }

  setData() {
    firstNamecontroller.text = staffData!.firstName ?? '';
    lastNamecontroller.text = staffData!.lastName ?? '';
    mobileNamecontroller.text = staffData!.mobileNo ?? '';
    emailcontroller.text = staffData!.userEmail ?? '';
    if (staffData!.userProfile != null) {
      print(staffData!.userProfile!.birthdate);
      address1eController.text = staffData!.userProfile!.address1 ?? '';
      address2Controller.text = staffData!.userProfile!.address2 ?? '';
      if (staffData!.profileImage != null) {
        imageName =
            "https://www.scfinvestmentgroup.com/public/upload/user_image/${staffData!.profileImage}";
      }
      birthController.text = staffData!.userProfile!.birthdate != null
          ? DateFormat('dd-MM-yyyy').format(
              DateTime.parse(staffData!.userProfile!.birthdate.toString()))
          : '';
      // passwordcontroller.text = customerData.userProfile.p
    }
    update();
  }

  popData() {
    print("========");
    firstNamecontroller.clear();
    lastNamecontroller.clear();
    mobileNamecontroller.clear();
    passwordcontroller.clear();
    confirmPasswordcontroller.clear();
    emailcontroller.clear();
    birthdatecontroller.clear();
    address1controller.clear();
    address2controller.clear();
    altmobilecontroller.clear();
    shiftStartcontroller.clear();
    shiftEndcontroller.clear();
    address1eController.clear();
    address2Controller.clear();
    birthController.clear();
    selectedDate = null;
    hasVehicle = false;
    customerImage = null;
    imageName = null;
    staffData = null;
    update();
  }

  imageUpload() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    customerImage = File(image!.path);
    imageName = customerImage!.path.split('/').last;
    update();
  }

  staffListApi() async {
    var response = await ImageUpload1.imageUploadService(
        firstName: firstNamecontroller.text.trim(),
        lastName: lastNamecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        mobile: mobileNamecontroller.text.trim(),
        address1: address1eController.text.trim(),
        address2: address2Controller.text.trim(),
        profileImage: customerImage,
        password: passwordcontroller.text.trim(),
        birthDate: birthDate);
    if (response != null) {
      imageName = '';
      firstNamecontroller.clear();
      lastNamecontroller.clear();
      mobileNamecontroller.clear();
      emailcontroller.clear();
      address1eController.clear();
      address2Controller.clear();
      birthController.clear();
      Get.back();
    }
  }

  upadteStaffApi() async {
    var staffListController = Get.put(StaaflistController());
    var response = await ImageUpload1.updateStaffimageUpload(
        id: staffData!.id.toString(),
        firstName: firstNamecontroller.text.trim(),
        lastName: lastNamecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        mobile: mobileNamecontroller.text.trim(),
        address1: address1eController.text.trim(),
        address2: address2Controller.text.trim(),
        profileImage: customerImage,
        birthDate: birthDate,
        password: passwordcontroller.text.trim());
    print(response);
    if (response != null) {
      imageName = '';
      firstNamecontroller.clear();
      lastNamecontroller.clear();
      mobileNamecontroller.clear();
      emailcontroller.clear();
      address1eController.clear();
      address2Controller.clear();
      birthController.clear();
      staffListController.staffListApi();
      Get.back();
      Get.rawSnackbar(
          message: response['response'],
          backgroundColor: ConstColor.color009846);
    }
  }

  selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate! : DateTime(1990),
        firstDate: DateTime(1990),
        lastDate: DateTime(2023),
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
      birthDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
      birthController
        ..text = DateFormat('dd-MM-yyyy').format(selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
