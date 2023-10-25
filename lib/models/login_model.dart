class LoginModel {
  String? status;
  int? statuscode;
  List<LoginResponse>? response;

  LoginModel({this.status, this.statuscode, this.response});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <LoginResponse>[];
      json['response'].forEach((v) {
        response!.add(LoginResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statuscode'] = statuscode;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginResponse {
  int? id;
  String? userType;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? userEmail;
  String? profileImage;
  String? status;
  String? isDeleted;
  String? token;
  String? createdAt;
  String? updatedAt;

  LoginResponse(
      {this.id,
      this.userType,
      this.firstName,
      this.lastName,
      this.mobileNo,
      this.userEmail,
      this.profileImage,
      this.status,
      this.isDeleted,
      this.token,
      this.createdAt,
      this.updatedAt});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    userEmail = json['user_email'];
    profileImage = json['profile_image'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_type'] = userType;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_no'] = mobileNo;
    data['user_email'] = userEmail;
    data['profile_image'] = profileImage;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['token'] = token;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
