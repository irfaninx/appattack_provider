
import 'dart:convert';

import 'package:appattack_provider/Model/CouponDetailsModel.dart';

CouponDealsModel CouponDealsModelFromJson(String str) =>
    CouponDealsModel.fromJson(json.decode(str));

String CouponDealsModelToJson(CouponDealsModel data) =>
    json.encode(data.toJson());

class CouponDealsModel {
  String? status;
  String? message;
  CouponDealsDataModel? data;

  CouponDealsModel({this.status, this.message, this.data});

  CouponDealsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new CouponDealsDataModel.fromJson(json['data']) : null;
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

class CouponDealsDataModel {
  List<CouponDetailsDataModel>? allDeals;
  List<CouponDetailsDataModel>? weeklyDeals;
  List<CouponDetailsDataModel>? newDeals;
  List<CouponDetailsDataModel>? popularDeals;
  AlertMsgData? alertMsgData;
 int? subscriptionType;
 int? subscriptionAmount;
 int? isPurchased;
  String? subscriptionDesc;
  String? subscriptionLogo;

  CouponDealsDataModel(
      {this.allDeals,
        this.weeklyDeals,
        this.newDeals,
        this.popularDeals,
        this.alertMsgData,
       this.subscriptionType,
       this.subscriptionAmount,
       this.isPurchased,
        this.subscriptionDesc,
        this.subscriptionLogo});

  CouponDealsDataModel.fromJson(Map<String, dynamic> json) {
    if (json['all_deals'] != null) {
      allDeals = <CouponDetailsDataModel>[];
      json['all_deals'].forEach((v) {
        allDeals!.add(new CouponDetailsDataModel.fromJson(v));
      });
    }
    if (json['weekly_deals'] != null) {
      weeklyDeals = <CouponDetailsDataModel>[];
      json['weekly_deals'].forEach((v) {
        weeklyDeals!.add(new CouponDetailsDataModel.fromJson(v));
      });
    }
    if (json['new_deals'] != null) {
      newDeals = <CouponDetailsDataModel>[];
      json['new_deals'].forEach((v) {
        newDeals!.add(new CouponDetailsDataModel.fromJson(v));
      });
    }
    if (json['popular_deals'] != null) {
      popularDeals = <CouponDetailsDataModel>[];
      json['popular_deals'].forEach((v) {
        popularDeals!.add(new CouponDetailsDataModel.fromJson(v));
      });
    }
    alertMsgData = json['alert_msg_data'] != null
        ? new AlertMsgData.fromJson(json['alert_msg_data'])
        : null;
   subscriptionType = json['subscription_type'];
   subscriptionAmount = json['subscription_amount'];
   isPurchased = json['is_purchased'];
    subscriptionDesc = json['subscription_desc'];
    subscriptionLogo = json['subscription_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allDeals != null) {
      data['all_deals'] = this.allDeals!.map((v) => v.toJson()).toList();
    }
    if (this.weeklyDeals != null) {
      data['weekly_deals'] = this.weeklyDeals!.map((v) => v.toJson()).toList();
    }
    if (this.newDeals != null) {
      data['new_deals'] = this.newDeals!.map((v) => v.toJson()).toList();
    }
    if (this.popularDeals != null) {
      data['popular_deals'] =
          this.popularDeals!.map((v) => v.toJson()).toList();
    }
    if (this.alertMsgData != null) {
      data['alert_msg_data'] = this.alertMsgData!.toJson();
    }
   data['subscription_type'] = this.subscriptionType;
   data['subscription_amount'] = this.subscriptionAmount;
   data['is_purchased'] = this.isPurchased;
    data['subscription_desc'] = this.subscriptionDesc;
    data['subscription_logo'] = this.subscriptionLogo;
    return data;
  }
}

class AlertMsgData {
  int? msgShowInApp;
  String? generalMsg;

  AlertMsgData({this.msgShowInApp, this.generalMsg});

  AlertMsgData.fromJson(Map<String, dynamic> json) {
    msgShowInApp = json['msg_show_in_app'];
    generalMsg = json['general_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg_show_in_app'] = this.msgShowInApp;
    data['general_msg'] = this.generalMsg;
    return data;
  }
}



class CouponDealsBody{
  String deviceID,collegeID;
  CouponDealsBody({
    required this.deviceID,
    required this.collegeID,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["device_id"] = deviceID;
    data["college_ID"] = collegeID;
    return data;
  }
}