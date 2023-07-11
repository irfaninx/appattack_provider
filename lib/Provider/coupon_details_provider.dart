import 'package:flutter/Material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../Model/CouponDetailsModel.dart';
import '../Utility/Network/NetworkManager.dart';
import '../Utility/StripeManager.dart';
import '../Utility/constant.dart';

class CouponDetailsProvider extends ChangeNotifier {
  final NetworkManager networkManager = NetworkManager();
  CouponDetailsDataModel? objCoupons = CouponDetailsDataModel();
  Map<String, dynamic>? paymentIntent;
  bool isLoading = false;

  Future<void> getCouponDetails(String couponID) async {
    isLoading = true;
    notifyListeners();
    final passdata = CouponDetailsBody(
      deviceID: deviceID,
      couponID : couponID,
    );
    final response = await networkManager.callCouponDetailsAPI(passdata);

    objCoupons = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> makePayment(context) async {
    try {
      paymentIntent = await StripeManager.createPaymentIntent('100', 'USD');
      var gpay = PaymentSheetGooglePay(merchantCountryCode: "USD",currencyCode: "US", testEnv: true);
      var apay = PaymentSheetApplePay(merchantCountryCode: "USD",buttonType: PlatformButtonType.order);
      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent![
              'client_secret'], //Gotten from payment intent
              applePay: apay,
              googlePay: gpay,
              style: ThemeMode.dark,
              merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {
      throw Exception(err);
    }
  }

  // Future<void> makePayment() async {
  //   try {
  //     paymentIntent = await networkManager.createPaymentIntent('500', 'INR');
  //
  //     var gpay = PaymentSheetGooglePay(merchantCountryCode: "INR",
  //         currencyCode: "IN",
  //         testEnv: true);
  //     var apay = PaymentSheetApplePay(merchantCountryCode: "INR",buttonType: PlatformButtonType.order);
  //
  //     //STEP 2: Initialize Payment Sheet
  //     await Stripe.instance
  //         .initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             applePay: apay,
  //             googlePay: gpay,
  //             merchantDisplayName: 'Irfan Tai',
  //             customerId: paymentIntent!['customer'],
  //             paymentIntentClientSecret: paymentIntent!['client_secret'],
  //             customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],
  //              //Gotten from payment intent
  //             style: ThemeMode.light,
  //             ))
  //         .then((value) {
  //       //STEP 3: Display Payment sheet
  //       displayPaymentSheet();
  //     });
  //
  //
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  displayPaymentSheet(context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  SizedBox(height: 10.0),
                  Text("Payment Successful!"),
                ],
              ),
            ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}