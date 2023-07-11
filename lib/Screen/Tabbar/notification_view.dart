import 'package:appattack_provider/Provider/notification_provider.dart';
import 'package:appattack_provider/Utility/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/notificationModel.dart';
import '../../Utility/Constant/color_constant.dart';
import '../../Utility/Network/NetworkManager.dart';
import '../../Widget/CustomProgressView.dart';
import '../coupon_details_view.dart';

class notification_view extends StatefulWidget {
  const notification_view({super.key});

  @override
  State<notification_view> createState() => _notification_viewState();
}

class _notification_viewState extends State<notification_view> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NotificationProvider>(context, listen: false).getNotificationData();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<NotificationProvider>(
        builder: (context,value,child) {
          if (value.isLoading) {
            return const Center(
              child: CustomProgressView(),
            );
          }  else {
            return _buildPosts(context, value.arrNotifications);
          }
        },
      ),
    );
  }

  ListView _buildPosts(BuildContext context, List<Notifications> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              radius: 20, // Image radius
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(0), // Border radius
                child: ClipOval(
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                            color: ColorConstants.primary),
                    imageUrl: posts[index].couponImage.toString(),
                  ),
                ),
              ),
            ),
            title: Text(
              posts[index].title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              posts[index].message.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => coupon_details_view(couponID: posts[index].couponId ?? "")))
            },
          ),
        );
      },
    );
  }
}
