import 'package:appattack_provider/Provider/coupon_details_provider.dart';
import 'package:appattack_provider/Provider/notification_provider.dart';
import 'package:appattack_provider/Provider/select_college_provider.dart';
import 'package:appattack_provider/Screen/Auth/forgotpassword_view.dart';
import 'package:appattack_provider/Screen/Auth/login_view.dart';
import 'package:appattack_provider/Screen/Auth/register_view.dart';
import 'package:appattack_provider/Screen/selectcollege.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'Model/studenthelpModel.dart';
import 'Provider/HomeProvider.dart';
import 'Screen/Tabbar/home_view.dart';
import 'Utility/Constant/app_constant.dart';
import 'Utility/Network/NetworkManager.dart';
import 'Utility/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Stripe.publishableKey = LibraryKey.StripeTestPublishKey;
  Stripe.merchantIdentifier = 'merchant.com.appattack.ios';
  await Stripe.instance.applySettings();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  init() {
    _getContactInfo();
  }

  Future _getContactInfo() async {
    final NetworkManager networkManager = NetworkManager();
    final passdata = ContactHelpBody(
      deviceID: deviceID,
    );
    print("Pass Data ${passdata}");
    studenthelpModel? data =  await networkManager.getStudentHelp(passdata);
    print("Student Help Model $data?.toJson()");
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ChangeNotifierProvider<CouponDetailsProvider>(create: (_) => CouponDetailsProvider()),
      ChangeNotifierProvider<SelectCollegeProvider>(create: (_) => SelectCollegeProvider()),
      ChangeNotifierProvider<NotificationProvider>(create: (_) => NotificationProvider()),
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ColorConstants.primary,
          appBarTheme: const AppBarTheme(color: ColorConstants.primary)),
      initialRoute: '/',
      routes: {
        '/': (context) => const selectcollege(),
        '/login': (context) => const login_view(),
        '/register': (context) => const register_view(),
        '/home': (context) => const home_view(),
        '/forgotpassword': (context) => const forgotpassword_view(),
      },
    ),);
  }
}