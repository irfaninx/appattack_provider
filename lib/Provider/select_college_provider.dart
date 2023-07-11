import 'package:appattack_provider/Service/select_college_service.dart';
import 'package:flutter/cupertino.dart';

import '../Model/selectcollegemodel.dart';

class SelectCollegeProvider extends ChangeNotifier {
  final _service = SelectCollegeService();
  bool isLoading = false;
  List<CollegeData> _arrCollege = [];
  List<CollegeData> get arrCollege => _arrCollege;

  Future<void> getCollege() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.callCollegeAPI() ?? [];

    _arrCollege = response;
    isLoading = false;
    notifyListeners();
  }
}