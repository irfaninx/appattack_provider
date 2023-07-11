import 'package:appattack_provider/Service/select_college_service.dart';
import 'package:flutter/cupertino.dart';

import '../Model/notificationModel.dart';
import '../Model/selectcollegemodel.dart';
import '../Utility/Network/NetworkManager.dart';
import '../Utility/constant.dart';

class NotificationProvider extends ChangeNotifier {
  final NetworkManager networkManager = NetworkManager();
  bool isLoading = false;
  List<Notifications> _arrNotifications = [];
  List<Notifications> get arrNotifications => _arrNotifications;

  Future<List<Notifications>?> getNotificationData() async {
    isLoading = true;
    notifyListeners();
    final passdata = NotificationBody(
      deviceID: deviceID,
    );
    final response = await networkManager.callNotificationAPI(passdata) ?? [];

    _arrNotifications = response;
    isLoading = false;
    notifyListeners();
  }
}