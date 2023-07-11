import 'dart:convert';

studenthelpModel studenthelpFromJson(String str) =>
    studenthelpModel.fromJson(json.decode(str));

String studenthelpToJson(studenthelpModel data) =>
    json.encode(data.toJson());

class studenthelpModel {
  String? status;
  String? message;
  studenthelpData? data;

  studenthelpModel({this.status, this.message, this.data});

  studenthelpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new studenthelpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class studenthelpData {
  List<HelpInfoModel>? helpInfo;
  AdminInfoModel? adminInfo;

  studenthelpData({this.helpInfo, this.adminInfo});

  studenthelpData.fromJson(Map<String, dynamic> json) {
    if (json['help_info'] != null) {
      helpInfo = <HelpInfoModel>[];
      json['help_info'].forEach((v) {
        helpInfo!.add(new HelpInfoModel.fromJson(v));
      });
    }
    adminInfo = json['admin_info'] != null
        ? new AdminInfoModel.fromJson(json['admin_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.helpInfo != null) {
      data['help_info'] = this.helpInfo!.map((v) => v.toJson()).toList();
    }
    if (this.adminInfo != null) {
      data['admin_info'] = this.adminInfo!.toJson();
    }
    return data;
  }
}

class HelpInfoModel {
  String? title;
  String? shortDescription;
  String? path;

  HelpInfoModel({this.title, this.shortDescription, this.path});

  HelpInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortDescription = json['short_description'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['path'] = this.path;
    return data;
  }
}

class AdminInfoModel {
  String? email;
  String? contactNumber;
  String? siteUrl;

  AdminInfoModel({this.email, this.contactNumber, this.siteUrl});

  AdminInfoModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    contactNumber = json['contact_number'];
    siteUrl = json['site_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['contact_number'] = this.contactNumber;
    data['site_url'] = this.siteUrl;
    return data;
  }
}

class ContactHelpBody{
  String deviceID;
  ContactHelpBody({
    required this.deviceID,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["device_id"] = deviceID;
    return data;
  }
}