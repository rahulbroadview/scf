import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/addcustomer/controllers/imageupload_service.dart';

import '../../../../models/customer_list_model.dart';

class AddcustomerController extends GetxController {
  CustomerListing? customerData = Get.arguments;
  final ImagePicker picker = ImagePicker();
  File? customerImage;
  DateTime? selectedDate1;
  DateTime? selectedDate;
  final count = 0.obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final address1eController = TextEditingController();
  final address2Controller = TextEditingController();
  final birthController = TextEditingController();
  String birtDate = '';
  final passwordcontroller = TextEditingController();
  final addcustomerKey = GlobalKey<FormState>();
  String? imageName;
  @override
  void onInit() {
    super.onInit();
    if (customerData != null) {
      setData();
    }
  }

  setData() {
    firstNameController.text = customerData!.firstName ?? '';
    lastNameController.text = customerData!.lastName ?? '';
    mobileController.text = customerData!.mobileNo ?? '';
    emailController.text = customerData!.userEmail ?? '';
    if (customerData!.userProfile != null) {
      address1eController.text = customerData!.userProfile!.address1 ?? '';
      address2Controller.text = customerData!.userProfile!.address2 ?? '';
      birthController.text = customerData!.userProfile!.birthdate != null
          ? DateFormat('dd-MM-yyyy').format(
              DateTime.parse(customerData!.userProfile!.birthdate.toString()))
          : '';

      // passwordcontroller.text = customerData.userProfile.p
    }
    update();
  }

  imageUpload() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    customerImage = File(image!.path);
    imageName = customerImage!.path.split('/').last;
    update();
  }

  addCustomer() async {
    var response = await ImageUpload.imageUploadService(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address1: address1eController.text.trim(),
        address2: address2Controller.text.trim(),
        profileImage: customerImage,
        birthDate: birtDate);
    if (response != null) {
      imageName = '';
      firstNameController.clear();
      lastNameController.clear();
      mobileController.clear();
      emailController.clear();
      address1eController.clear();
      address2Controller.clear();
      birthController.clear();
      Get.back();
    }
  }

  updateCustomer() async {
    var response = await ImageUpload.imageUpdateService(
        id: customerData!.id.toString(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address1: address1eController.text.trim(),
        address2: address2Controller.text.trim(),
        profileImage: customerImage,
        password: passwordcontroller.text.trim(),
        birthDate: birtDate);

    if (response != null) {
      imageName = '';
      firstNameController.clear();
      lastNameController.clear();
      mobileController.clear();
      emailController.clear();
      address1eController.clear();
      address2Controller.clear();
      birthController.clear();
      Get.back();
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
}
