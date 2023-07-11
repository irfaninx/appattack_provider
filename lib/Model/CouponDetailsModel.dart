
import 'dart:convert';

CouponDetailsModel CouponDetailsModelFromJson(String str) =>
    CouponDetailsModel.fromJson(json.decode(str));

String CouponDetailsModelToJson(CouponDetailsModel data) =>
    json.encode(data.toJson());

class CouponDetailsModel {
  String? status;
  String? message;
  CouponDetailsDataModel? data;

  CouponDetailsModel({this.status, this.message, this.data});

  CouponDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new CouponDetailsDataModel.fromJson(json['data']) : null;
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

class CouponDetailsDataModel {
  String? couponId;
  String? couponImage;
  String? couponTitle;
  String? shortDescription;
  String? disclaimer;
  String? hyperlink;
  String? isWeeklyDeal;
  String? isLocationRequired;
  String? savingAmount;
  String? expiredTimestamp;
  CouponLimit? couponLimit;
  CouponsDate? date;
  CouponsTime? time;
  String? businessId;
  String? businessName;

  CouponDetailsDataModel(
      {this.couponId,
        this.couponImage,
        this.couponTitle,
        this.shortDescription,
        this.disclaimer,
        this.hyperlink,
        this.isWeeklyDeal,
        this.isLocationRequired,
        this.savingAmount,
        this.expiredTimestamp,
        this.couponLimit,
        this.date,
        this.time,
        this.businessId,
        this.businessName});

  CouponDetailsDataModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponImage = json['coupon_image'];
    couponTitle = json['coupon_title'];
    shortDescription = json['short_description'];
    disclaimer = json['disclaimer'];
    hyperlink = json['hyperlink'];
    isWeeklyDeal = json['is_weekly_deal'];
    isLocationRequired = json['is_location_required'];
    savingAmount = json['saving_amount'];
    expiredTimestamp = json['expired_timestamp'];
    couponLimit = json['coupon_limit'] != null
        ? new CouponLimit.fromJson(json['coupon_limit'])
        : null;
    date = json['date'] != null ? new CouponsDate.fromJson(json['date']) : null;
    time = json['time'] != null ? new CouponsTime.fromJson(json['time']) : null;
    businessId = json['business_id'];
    businessName = json['business_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_image'] = this.couponImage;
    data['coupon_title'] = this.couponTitle;
    data['short_description'] = this.shortDescription;
    data['disclaimer'] = this.disclaimer;
    data['hyperlink'] = this.hyperlink;
    data['is_weekly_deal'] = this.isWeeklyDeal;
    data['is_location_required'] = this.isLocationRequired;
    data['saving_amount'] = this.savingAmount;
    data['expired_timestamp'] = this.expiredTimestamp;
    if (this.couponLimit != null) {
      data['coupon_limit'] = this.couponLimit!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    data['business_id'] = this.businessId;
    data['business_name'] = this.businessName;
    return data;
  }
}

class CouponLimit {
  String? limitType;
  String? totalLimitCount;
  String? usageLimitCount;

  CouponLimit({this.limitType, this.totalLimitCount, this.usageLimitCount});

  CouponLimit.fromJson(Map<String, dynamic> json) {
    limitType = json['limit_type'];
    totalLimitCount = json['total_limit_count'];
    usageLimitCount = json['usage_limit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit_type'] = this.limitType;
    data['total_limit_count'] = this.totalLimitCount;
    data['usage_limit_count'] = this.usageLimitCount;
    return data;
  }
}

class CouponsDate {
  String? startDate;
  String? endDate;

  CouponsDate({this.startDate, this.endDate});

  CouponsDate.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class CouponsTime {
  String? allDay;
  String? startTime;
  String? endTime;

  CouponsTime({this.allDay, this.startTime, this.endTime});

  CouponsTime.fromJson(Map<String, dynamic> json) {
    allDay = json['all_day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_day'] = this.allDay;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class CouponDetailsBody{
  String deviceID,couponID;
  CouponDetailsBody({
    required this.deviceID,
    required this.couponID,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["device_id"] = deviceID;
    data["coupon_id"] = couponID;
    return data;
  }
}