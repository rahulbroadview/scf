class TimeLineModel {
  String? status;
  int? statuscode;
  List<TimeLineList>? response;

  TimeLineModel({this.status, this.statuscode, this.response});

  TimeLineModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    if (json['response'] != null) {
      response = <TimeLineList>[];
      json['response'].forEach((v) {
        response!.add(TimeLineList.fromJson(v));
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

class TimeLineList {
  int? id;
  int? loanFileId;
  String? fileStatus;
  String? remarks;
  int? byUserId;
  String? createdAt;

  TimeLineList(
      {this.id,
      this.loanFileId,
      this.fileStatus,
      this.remarks,
      this.byUserId,
      this.createdAt});

  TimeLineList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanFileId = json['loan_file_id'];
    fileStatus = json['file_status'];
    remarks = json['remarks'];
    byUserId = json['by_user_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loan_file_id'] = loanFileId;
    data['file_status'] = fileStatus;
    data['remarks'] = remarks;
    data['by_user_id'] = byUserId;
    data['created_at'] = createdAt;
    return data;
  }
}
