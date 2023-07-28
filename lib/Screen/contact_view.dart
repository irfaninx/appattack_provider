import 'package:appattack_provider/Model/studenthelpModel.dart';
import 'package:appattack_provider/Utility/Network/NetworkManager.dart';
import 'package:appattack_provider/Utility/SharePreferance/shared_preferences.dart';
import 'package:appattack_provider/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utility/Constant/app_constant.dart';

class contact_view extends StatefulWidget {
  const contact_view({super.key});

  @override
  State<contact_view> createState() => _contact_viewState();
}

class _contact_viewState extends State<contact_view> {
  studenthelpData objModel = studenthelpData();
  void initState() {
    super.initState();
    _getContactInfo();
  }

  _getContactInfo() async {
    try {
      Map<String, dynamic> tmpcollegeJson =
      await shared_preferences.shared.ClassValuesSF(UserDefaultKeys.contactHelp.toString());
      print("Temp College ${studenthelpModel.fromJson(tmpcollegeJson).data?.adminInfo?.siteUrl ?? "Demo"}");
      setState(()  {
          objModel = studenthelpModel.fromJson(tmpcollegeJson).data ?? _callContactInfoAPI();
      });
    } catch (Excepetion) {
      _callContactInfoAPI();
      print("Contact info not found");
    }
  }

  _callContactInfoAPI() async {
    final NetworkManager networkManager = NetworkManager();
    final passdata = ContactHelpBody(
      deviceID: deviceID,
    );
    print("Pass Data ${passdata}");
    studenthelpModel? data =  await networkManager.getStudentHelp(passdata);
    setState(() {
              objModel = data?.data ?? studenthelpData();
    });
    print("Student Help Model $data?.toJson()");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.email),
              title: Text(objModel.adminInfo?.email ?? ""),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text(objModel.adminInfo?.contactNumber ?? ""),
              onTap: () {
                launchUrl(Uri.parse("tel://+${objModel.adminInfo?.contactNumber ?? ""}"));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(objModel.adminInfo?.siteUrl ?? ""),
              onTap: () {
                launchUrl(Uri.parse(objModel.adminInfo?.siteUrl ?? ""));
              },
            ),
          ],
        ),
      ),
    );
  }
}

