import 'dart:developer';

import 'package:http/http.dart' as http;

import '../Model/selectcollegemodel.dart';
import '../Utility/Constant/ApiConstants.dart';

class SelectCollegeService {
  Future<List<CollegeData>?> callCollegeAPI() async {
    try {
      var url = Uri.parse(BASEURL.current + WebServices.collegeList);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return selectCollegeFromJson(response.body).data;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}