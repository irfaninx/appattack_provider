import 'package:appattack_provider/Service/HomeService.dart';
import 'package:appattack_provider/Utility/SharePreferance/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

import '../Model/CouponDealsModel.dart';
import '../Model/CouponDetailsModel.dart';
import '../Utility/Constant/app_constant.dart';

class HomeProvider extends ChangeNotifier {
  final _service = HomeService();
  bool isLoading = false;
  List<CouponDetailsDataModel> _arrCoupons = [];
  List<CouponDetailsDataModel> get arrCoupons => _arrCoupons;

  Future<void> getDeals(String deviceID) async {
    var clgID = await shared_preferences.shared.getStringValuesSF(UserDefaultKeys.collageID.toString());
    isLoading = true;
    notifyListeners();
    final passdata = CouponDealsBody(
      deviceID: deviceID,
      collegeID: clgID,
    );
    final response = await _service.callDealsAPI(passdata) ?? [];

    _arrCoupons = response;
    isLoading = false;
    notifyListeners();
  }
}