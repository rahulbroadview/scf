class StaffListModel {
  String? status;
  int? statuscode;
  List<StaffList>? response;

  StaffListModel({this.status, this.statuscode, this.response});

  StaffListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <StaffList>[];
      json['response'].forEach((v) {
        response!.add(StaffList.fromJson(v));
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

class StaffList {
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
  UserProfile? userProfile;

  StaffList(
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
      this.updatedAt,
      this.userProfile});

  StaffList.fromJson(Map<String, dynamic> json) {
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
    userProfile = json['user_profile'] != null
        ? UserProfile.fromJson(json['user_profile'])
        : null;
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
    if (userProfile != null) {
      data['user_profile'] = userProfile!.toJson();
    }
    return data;
  }
}

class UserProfile {
  int? id;
  int? userId;
  String? birthdate;
  String? address1;
  String? address2;
  String? idProof;
  String? altMobileNo;
  String? shiftStartTime;
  String? shiftEndTime;
  String? hasVehicle;
  String? isDeleted;
  String? createdAt;
  String? updatedAt;

  UserProfile(
      {this.id,
      this.userId,
      this.birthdate,
      this.address1,
      this.address2,
      this.idProof,
      this.altMobileNo,
      this.shiftStartTime,
      this.shiftEndTime,
      this.hasVehicle,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    birthdate = json['birthdate'];
    address1 = json['address1'];
    address2 = json['address2'];
    idProof = json['id_proof'];
    altMobileNo = json['alt_mobile_no'];
    shiftStartTime = json['shift_start_time'];
    shiftEndTime = json['shift_end_time'];
    hasVehicle = json['has_vehicle'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['birthdate'] = birthdate;
    data['address1'] = address1;
    data['address2'] = address2;
    data['id_proof'] = idProof;
    data['alt_mobile_no'] = altMobileNo;
    data['shift_start_time'] = shiftStartTime;
    data['shift_end_time'] = shiftEndTime;
    data['has_vehicle'] = hasVehicle;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
