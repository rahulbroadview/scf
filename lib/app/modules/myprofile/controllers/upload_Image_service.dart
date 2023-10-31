import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/url_utils.dart';
import '../../../data/services/api_services.dart';

class ProfileImageUpload {
  static imageUploadService(
      {File? profileImage,
      File? idProof,
      String? firstName,
      String? lastName,
      String? mobile,
      String? email,
      String? address1,
      String? address2,
      String? password,
      String? birthDate}) async {
    String? fileName;
    final prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    if (profileImage != null) {
      fileName = profileImage.path.split('/').last;
    }
    print(birthDate);
    var data = FormData.fromMap({
      if (profileImage != null)
        'profile_image': await MultipartFile.fromFile(profileImage.path,
            filename: fileName!),
      if (idProof != null)
        'id_proof':
            await MultipartFile.fromFile('/path/to/file', filename: 'file'),
      "id": id,
      'user_type': 'staff',
      'first_name': firstName,
      'last_name': lastName,
      'mobile_no': mobile,
      'user_email': email,
      'birthdate': birthDate,
      'address1': address1,
      'address2': address2,
      'alt_mobile_no': '',
      'shift_start_time': '',
      'shift_end_time': '',
      'has_vehicle': '',
      'login_id': id,
      'token': token
    });

    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.updateUser, data);
    if (finalData != null) {
      print("=====$finalData");
      return finalData;
      // CustomerListModel userData = CustomerListModel.fromJson(finalData);
      // if (userData.response != null) {
      //   customerList = userData.response!;
      // }
      // print(customerList.length);
    }
  }

  static imageUpdateService(
      {String? id,
      File? profileImage,
      File? idProof,
      String? firstName,
      String? lastName,
      String? mobile,
      String? email,
      String? address1,
      String? address2,
      String? password,
      String? birthDate}) async {
    String? fileName;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id1 = prefs.getString('id') ?? '';
    if (profileImage != null) {
      fileName = profileImage.path.split('/').last;
    }
    print(fileName);
    print(id);
    var data = FormData.fromMap({
      if (profileImage != null)
        'profile_image': await MultipartFile.fromFile(profileImage.path,
            filename: fileName!),
      if (idProof != null)
        'id_proof':
            await MultipartFile.fromFile('/path/to/file', filename: 'file'),
      "id": id,
      'user_type': 'customer',
      'first_name': firstName,
      'last_name': lastName,
      'mobile_no': mobile,
      'password': password,
      'user_email': email,
      'birthdate': birthDate,
      'address1': address1,
      'address2': address2,
      'alt_mobile_no': '',
      'shift_start_time': '',
      'shift_end_time': '',
      'has_vehicle': '',
      'login_id': id1,
      'token': token
    });

    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.updateUser, data);
    if (finalData != null) {
      print("=====$finalData");
      return finalData;
      // CustomerListModel userData = CustomerListModel.fromJson(finalData);
      // if (userData.response != null) {
      //   customerList = userData.response!;
      // }
      // print(customerList.length);
    }
  }
}
