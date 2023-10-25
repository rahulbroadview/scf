class FileDetailsModel {
  String? status;
  int? statuscode;
  List<FileDetailsList>? response;

  FileDetailsModel({this.status, this.statuscode, this.response});

  FileDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <FileDetailsList>[];
      json['response'].forEach((v) {
        response!.add(FileDetailsList.fromJson(v));
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

class FileDetailsList {
  int? id;
  int? customerId;
  String? loanFileId;
  String? documentName;
  String? isCollect;
  String? remarks;
  int? byUserId;
  String? status;
  String? isDeleted;
  String? collectedDate;
  String? updatedAt;

  FileDetailsList(
      {this.id,
      this.customerId,
      this.loanFileId,
      this.documentName,
      this.isCollect,
      this.remarks,
      this.byUserId,
      this.status,
      this.isDeleted,
      this.collectedDate,
      this.updatedAt});

  FileDetailsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    loanFileId = json['loan_file_id'];
    documentName = json['document_name'];
    isCollect = json['is_collect'];
    remarks = json['remarks'];
    byUserId = json['by_user_id'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    collectedDate = json['collected_date'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['loan_file_id'] = loanFileId;
    data['document_name'] = documentName;
    data['is_collect'] = isCollect;
    data['remarks'] = remarks;
    data['by_user_id'] = byUserId;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['collected_date'] = collectedDate;
    data['updated_at'] = updatedAt;
    return data;
  }
}
