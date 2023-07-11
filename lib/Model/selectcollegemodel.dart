import 'dart:convert';

selectCollegeModel selectCollegeFromJson(String str) =>
    selectCollegeModel.fromJson(json.decode(str));

String selectCollegeToJson(selectCollegeModel data) =>
    json.encode(data.toJson());

class selectCollegeModel {
  String? status;
  String? message;
  List<CollegeData>? data;

  selectCollegeModel({this.status, this.message, this.data});

  selectCollegeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CollegeData>[];
      json['data'].forEach((v) {
        data!.add(new CollegeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CollegeData {
  String? collegeID;
  String? collegeName;
  String? collegeUrl;
  int? isLoginRequired;

  CollegeData(
      {this.collegeID,
      this.collegeName,
      this.collegeUrl,
      this.isLoginRequired});

  CollegeData.fromJson(Map<String, dynamic> json) {
    collegeID = json['college_ID'];
    collegeName = json['college_name'];
    collegeUrl = json['college_url'];
    isLoginRequired = json['is_login_required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['college_ID'] = this.collegeID;
    data['college_name'] = this.collegeName;
    data['college_url'] = this.collegeUrl;
    data['is_login_required'] = this.isLoginRequired;
    return data;
  }
}
