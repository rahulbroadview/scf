class FollowUpModel {
  String? status;
  int? statuscode;
  List<FollowFileList>? response;

  FollowUpModel({this.status, this.statuscode, this.response});

  FollowUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <FollowFileList>[];
      json['response'].forEach((v) {
        response!.add(FollowFileList.fromJson(v));
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

class FollowFileList {
  int? id;
  int? loanFileId;
  String? remindDate;
  String? remarks;
  int? byUserId;
  String? followUpDate;

  FollowFileList(
      {this.id,
      this.loanFileId,
      this.remindDate,
      this.remarks,
      this.byUserId,
      this.followUpDate});

  FollowFileList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanFileId = json['loan_file_id'];
    remindDate = json['remind_date'];
    remarks = json['remarks'];
    byUserId = json['by_user_id'];
    followUpDate = json['follow_up_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loan_file_id'] = loanFileId;
    data['remind_date'] = remindDate;
    data['remarks'] = remarks;
    data['by_user_id'] = byUserId;
    data['follow_up_date'] = followUpDate;
    return data;
  }
}
