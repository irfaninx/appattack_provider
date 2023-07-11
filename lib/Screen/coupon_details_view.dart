import 'package:appattack_provider/Provider/coupon_details_provider.dart';
import 'package:appattack_provider/Screen/redeem_coupon_view.dart';
import 'package:appattack_provider/Widget/CustomProgressView.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Utility/Constant/image_constant.dart';


class coupon_details_view extends StatefulWidget {
  coupon_details_view({super.key,required this.couponID});
  final String couponID;

  @override
  State<coupon_details_view> createState() => _coupon_details_viewState();
}

class _coupon_details_viewState extends State<coupon_details_view> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CouponDetailsProvider>(context, listen: false).getCouponDetails(widget.couponID);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(),
        title: Text("Coupon Details".toUpperCase()),
      ),
      body: Consumer<CouponDetailsProvider>(
        builder: (context,value,child) {
          if (value.isLoading) {
            return const Center(
              child: CustomProgressView(),
            );
          }  else {
            return Container(
              height: double.infinity,
              color: Colors.grey,
              padding:EdgeInsets.only(bottom: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 50),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 700,
                          ),
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(value.objCoupons?.couponImage ?? "",fit: BoxFit.fill),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width - 160,
                            child: Container(
                              height: MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width - 70,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (value.objCoupons?.couponTitle ?? "").toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        value.objCoupons?.shortDescription ?? "",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    color: Colors.grey,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 5.0),
                                                    child: Text(
                                                      "Valid till",
                                                      style:
                                                      TextStyle(color: Colors.grey),
                                                    ),
                                                  ),
                                                  Text(value.objCoupons?.date?.endDate ?? ""),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    color: ColorConstants.primary,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 5.0),
                                                    child: Text(
                                                      "Expire in 8 days.",
                                                      style: TextStyle(
                                                          color:
                                                          ColorConstants.primary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Save \$ ${value.objCoupons?.savingAmount ?? '0'}",
                                                style: const TextStyle(
                                                    color: ColorConstants.primary),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child:QrImageView(
                                              data: value.objCoupons?.couponId ?? "",
                                              size: 100,
                                              // You can include embeddedImageStyle Property if you
                                              //wanna embed an image from your Asset folder
                                              embeddedImageStyle: const QrEmbeddedImageStyle(
                                                size: Size(
                                                  50,
                                                  50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.topRight,
                                          widthFactor: 120,
                                          child: Container(
                                              width: 150,
                                              child: const Text(
                                                "QR Code is for redemption purpose",
                                                style: TextStyle(color: Colors.grey),
                                                textAlign: TextAlign.center,
                                              ))),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: ColorConstants.primary,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Text(
                                              value.objCoupons?.businessName ?? "",
                                              style: const TextStyle(
                                                  color: ColorConstants.primary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        value.objCoupons?.disclaimer ?? "",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon:
                                            Image.asset(ImageConstants.coupon_hour),
                                            iconSize: 50,
                                            onPressed: () {},
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                                ImageConstants.coupon_infinite),
                                            iconSize: 50,
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(

        width: double.infinity,
        height: 50,
        child: Consumer<CouponDetailsProvider>(
          builder: (context,value,child) {
            return ElevatedButton(
                onPressed: () async {
                  showModalBottomSheet<void>(
                      useRootNavigator: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const redeem_coupon_view();
                      });
            }, child: Text(
            "REDEEM COUPON".toUpperCase(),
            style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorConstants.primary),
            )
            );
          }
        ),
        ),
    );
  }


}
