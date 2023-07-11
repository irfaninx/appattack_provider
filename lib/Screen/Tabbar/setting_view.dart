import 'package:appattack_provider/Screen/Auth/changepassword_view.dart';
import 'package:appattack_provider/Screen/Auth/editprofile_view.dart';
import 'package:appattack_provider/Screen/contact_view.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Utility/Constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utility/constant.dart';
import '../help_support_view.dart';

class setting_view extends StatefulWidget {
  const setting_view({super.key});

  @override
  State<setting_view> createState() => _setting_viewState();
}

class _setting_viewState extends State<setting_view> {
  bool isNewCoupons = false;
  bool isExpiredCoupons = false;
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            TextButton(
                onPressed: () {},
                child: settingCell(
                  title: "YOUR SAVING",
                  strImage: ImageConstants.saveMoney,
                )),
            TextButton(
                onPressed: () {
                  Share.share(AppStoreLink);
                },
                child: settingCell(
                  title: "SHARE",
                  strImage: ImageConstants.share,
                )),
            Visibility(
              visible: isLogin,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true,).push(MaterialPageRoute(
                        builder: (context) => const changepassword_view()));
                  },
                  child: settingCell(
                    title: "CHANGE PASSWORD",
                    strImage: ImageConstants.changePassword,
                  )),
            ),
            Visibility(
              visible: isLogin,
              child: TextButton(
                  onPressed: () {},
                  child: settingCell(
                    title: "PLAN HISTORY",
                    strImage: ImageConstants.planHistory,
                  )),
            ),
            Visibility(
              visible: isLogin,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                        builder: (context) => const editprofile_view()));
                  },
                  child: settingCell(
                    title: "EDIT PROFILE",
                    strImage: ImageConstants.editProfile,
                  )),
            ),
            TextButton(
                onPressed: () {
                  launchUrl(Uri.parse(About_us));
                },
                child: settingCell(
                  title: "ABOUT US",
                  strImage: ImageConstants.info,
                )),
            TextButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                      useRootNavigator: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const contact_view();
                      });
                },
                child: settingCell(
                  title: "CONTACT US",
                  strImage: ImageConstants.contact,
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => const help_support_view()));
                },
                child: settingCell(
                  title: "HELP & SUPPORT",
                  strImage: ImageConstants.lifesaver,
                )),
            Visibility(
              visible: isLogin,
              child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: settingCell(
                    title: "Delete account".toUpperCase(),
                    strImage: ImageConstants.deleteAccount,
                  )),
            ),
            Visibility(
              visible: isLogin,
              child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: settingCell(
                    title: "LOGOUT",
                    strImage: ImageConstants.logout,
                  )),
            ),
            const Divider(
              height: 2,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: ColorConstants.deviderColor,
            ),
            TextButton(
                onPressed: () {},
                child: settingCell(
                  title: "NOTIFICATION",
                  strImage: ImageConstants.alarm,
                )),

            SwitchListTile.adaptive(
                activeColor: ColorConstants.primary,
                title: const Text(
                  'New Coupons',
                  style: TextStyle(color: ColorConstants.primary),
                ),
                value: isNewCoupons,
                onChanged: (value) {
                  setState(() {
                    isNewCoupons = value;
                  });
                }),
            SwitchListTile.adaptive(
                activeColor: ColorConstants.primary,
                title: const Text(
                  'Expired Coupons',
                  style: TextStyle(color: ColorConstants.primary),
                ),
                value: isExpiredCoupons,
                onChanged: (value) {
                  setState(() {
                    isExpiredCoupons = value;
                  });
                })
          ]),
        ),
      ),
    );
  }
}

class settingCell extends StatelessWidget {
  final String title;
  final String strImage;
  final bool isTrailing;
  const settingCell({super.key, required this.title, required this.strImage,this.isTrailing = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: ColorConstants.primary,
      textColor: Colors.black,
      leading: Image.asset(strImage,
          height: 25,
          width: 25,
          fit: BoxFit.fill,
          color: ColorConstants.primary),
      title: Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
