class LoanTypeModel {
  String? status;
  int? statuscode;
  List<LoanTypeList>? response;

  LoanTypeModel({this.status, this.statuscode, this.response});

  LoanTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <LoanTypeList>[];
      json['response'].forEach((v) {
        response!.add(LoanTypeList.fromJson(v));
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

class LoanTypeList {
  int? id;
  String? loanType;
  String? categoryName;
  String? status;
  String? isDeleted;
  String? createdAt;
  String? updatedAt;

  LoanTypeList(
      {this.id,
      this.loanType,
      this.categoryName,
      this.status,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  LoanTypeList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanType = json['loan_type'];
    categoryName = json['category_name'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loan_type'] = loanType;
    data['category_name'] = categoryName;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
