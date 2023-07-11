import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:appattack_provider/Model/CouponDetailsModel.dart';
import 'package:appattack_provider/Utility/Constant/ApiConstants.dart';
import 'package:appattack_provider/Utility/SharePreferance/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Model/notificationModel.dart';
import '../../Model/studenthelpModel.dart';
import '../Constant/app_constant.dart';

class NetworkManager {


  Future<List<Notifications>?> callNotificationAPI(NotificationBody data) async {
    try {
      var url = Uri.parse(BASEURL.current + WebServices.notifications);
      var response = await http.post(url,
          // body: jsonEncode(passdata)
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(data.toJson()));
      if (response.statusCode == 200) {
        print('response Data ${response.body}');
        return notificationModelFromJson(response.body).data?.notifications;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<studenthelpModel?> getStudentHelp(ContactHelpBody data) async {
    try {
      var url = Uri.parse(BASEURL.current + WebServices.contactandhelp);
      var response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(data.toJson()));
      if (response.statusCode == 200) {
        print('response Data ${response.body}');
        shared_preferences.shared.setClassToSF(UserDefaultKeys.contactHelp.toString(), studenthelpFromJson(response.body).toJson());
        return studenthelpFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<CouponDetailsDataModel?> callCouponDetailsAPI(CouponDetailsBody data) async {
    try {
      var url = Uri.parse(BASEURL.current + WebServices.couponDetail);
      var response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(data.toJson()));
      if (response.statusCode == 200) {
        print('response Data ${response.body}');
        return CouponDetailsModelFromJson(response.body).data;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}
