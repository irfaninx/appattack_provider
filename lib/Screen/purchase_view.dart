import 'package:flutter/Material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../Utility/Constant/color_constant.dart';
import '../Utility/StripeManager.dart';

class purchase_view extends StatefulWidget {
  const purchase_view({super.key});

  @override
  State<purchase_view> createState() => _purchase_viewState();
}

class _purchase_viewState extends State<purchase_view> {
  Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(),
        title: Text("Purchase".toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Welcome Ios Test",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(color: Colors.grey,fontSize: 15), /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                      text: 'In order to obtain the coupons for',),
                  TextSpan(
                      text: ' 1 Month ',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'of',
                      ),
                  TextSpan(
                      text: ' INX ORGANIZATION, ',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: 'You are required to make a one-time purchase.',
                  ),
                ],
              ),
            ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset("icon/icon.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text("The purchase is a one-time transaction. if you would like a refund. please get in touch with the admistrator."
                    "The purchase is a one-time transaction. if you would like a refund. please get in touch with the admistrator."
                    "The purchase is a one-time transaction. if you would like a refund. please get in touch with the admistrator."
                    "The purchase is a one-time transaction. if you would like a refund. please get in touch with the admistrator."
                    "The purchase is a one-time transaction. if you would like a refund. please get in touch with the admistrator.",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.grey ),
                  textAlign: TextAlign.center,),
              ],
            ),

          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(

        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            await makePayment();
          },
          child: Text(
            "BUY".toUpperCase(),
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorConstants.primary),
          ),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await StripeManager.createPaymentIntent('100', 'USD');
      var gpay = const PaymentSheetGooglePay(merchantCountryCode: "USD",currencyCode: "US", testEnv: true);
      var apay = const PaymentSheetApplePay(merchantCountryCode: "USD",buttonType: PlatformButtonType.order);
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
      displayPaymentSheet();
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

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
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
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
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
