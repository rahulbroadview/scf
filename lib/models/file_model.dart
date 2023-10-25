class FileListModel {
  String? status;
  int? statuscode;
  List<FileList>? response;

  FileListModel({this.status, this.statuscode, this.response});

  FileListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <FileList>[];
      json['response'].forEach((v) {
        response!.add(FileList.fromJson(v));
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

class FileList {
  int? id;
  int? customerId;
  int? staffId;
  int? loanCategoryId;
  String? fileNo;
  String? bankName;
  String? loanAmount;
  String? loanFees;
  Null? sanctionAmount;
  String? fileStatus;
  String? status;
  String? isDeleted;
  String? createdAt;
  String? updatedAt;
  ViewUser? viewUser;

  FileList(
      {this.id,
      this.customerId,
      this.staffId,
      this.loanCategoryId,
      this.fileNo,
      this.bankName,
      this.loanAmount,
      this.loanFees,
      this.sanctionAmount,
      this.fileStatus,
      this.status,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.viewUser});

  FileList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    staffId = json['staff_id'];
    loanCategoryId = json['loan_category_id'];
    fileNo = json['file_no'];
    bankName = json['bank_name'];
    loanAmount = json['loan_amount'];
    loanFees = json['loan_fees'];
    sanctionAmount = json['sanction_amount'];
    fileStatus = json['file_status'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    viewUser =
        json['view_user'] != null ? ViewUser.fromJson(json['view_user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['staff_id'] = staffId;
    data['loan_category_id'] = loanCategoryId;
    data['file_no'] = fileNo;
    data['bank_name'] = bankName;
    data['loan_amount'] = loanAmount;
    data['loan_fees'] = loanFees;
    data['sanction_amount'] = sanctionAmount;
    data['file_status'] = fileStatus;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (viewUser != null) {
      data['view_user'] = viewUser!.toJson();
    }
    return data;
  }
}

class ViewUser {
  int? id;
  String? userType;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? userEmail;
  String? profileImage;
  String? status;
  String? isDeleted;
  Null? token;
  String? createdAt;
  String? updatedAt;
  Null? deviceToken;

  ViewUser(
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
      this.deviceToken});

  ViewUser.fromJson(Map<String, dynamic> json) {
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
    deviceToken = json['device_token'];
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
    data['device_token'] = deviceToken;
    return data;
  }
}
