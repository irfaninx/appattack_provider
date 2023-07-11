import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:appattack_provider/Model/CouponDetailsModel.dart';
import 'package:http/http.dart' as http;

import '../Model/CouponDealsModel.dart';
import '../Utility/Constant/ApiConstants.dart';

class HomeService {
  Future<List<CouponDetailsDataModel>?> callDealsAPI(CouponDealsBody data) async {
    try {
      var url = Uri.parse(BASEURL.current + WebServices.collegeDeals);
      var response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(data.toJson()));
      if (response.statusCode == 200) {
        print('response Data ${response.body}');
        return CouponDealsModelFromJson(response.body).data?.allDeals ?? [];
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

