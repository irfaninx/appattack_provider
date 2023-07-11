import 'package:appattack_provider/Provider/HomeProvider.dart';
import 'package:appattack_provider/Widget/Deal_Cell_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/CouponDetailsModel.dart';
import '../../Utility/constant.dart';
import '../../Widget/CustomProgressView.dart';
import '../coupon_details_view.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getDeals(deviceID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context,value,child) {
          if (value.isLoading) {
            return const Center(
              child: CustomProgressView(),
            );
          }  else {
            return _buildPosts(context, value.arrCoupons);
          }
        },
      ),
    );
  }

  ListView _buildPosts(BuildContext context, List<CouponDetailsDataModel> arrCoupons) {
    return ListView.builder(
      itemCount: arrCoupons.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return InkWell(child: Deal_Cell_view(objModel: arrCoupons[index],),
          onTap: () => {
            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => coupon_details_view(couponID: arrCoupons[index].couponId ?? "",)))
          },);
        },
    );
  }
}
