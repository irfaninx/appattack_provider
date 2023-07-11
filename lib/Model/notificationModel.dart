import 'dart:convert';

notificationModel notificationModelFromJson(String str) =>
    notificationModel.fromJson(json.decode(str));

String notificationModelToJson(notificationModel data) =>
    json.encode(data.toJson());

class notificationModel {
  String? status;
  String? message;
  notoficationData? data;

  notificationModel({this.status, this.message, this.data});

  notificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new notoficationData.fromJson(json['data'])
        : null;
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

class notoficationData {
  List<Notifications>? notifications;

  notoficationData({this.notifications});

  notoficationData.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  int? id;
  String? title;
  String? message;
  String? couponId;
  String? createdAt;
  String? couponImage;

  Notifications(
      {this.id,
      this.title,
      this.message,
      this.couponId,
      this.createdAt,
      this.couponImage});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    couponId = json['coupon_id'];
    createdAt = json['created_at'];
    couponImage = json['coupon_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['coupon_id'] = this.couponId;
    data['created_at'] = this.createdAt;
    data['coupon_image'] = this.couponImage;
    return data;
  }
}


class NotificationBody{
  String deviceID;
  NotificationBody({
    required this.deviceID,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["device_id"] = deviceID;
    return data;
  }
}