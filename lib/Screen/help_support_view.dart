import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Utility/SharePreferance/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/studenthelpModel.dart';
import '../Utility/Constant/app_constant.dart';
import '../Utility/Network/NetworkManager.dart';
import '../Utility/constant.dart';

class help_support_view extends StatefulWidget {
  const help_support_view({super.key});

  @override
  State<help_support_view> createState() => _help_support_viewState();
}

class _help_support_viewState extends State<help_support_view> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(),
        title: Text("Help & Support"),
      ),
      body: _buildPosts(context,objModel.helpInfo ?? []),
    );
  }

  ListView _buildPosts(BuildContext context, List<HelpInfoModel> arrHelp) {
    return ListView.builder(
      itemCount: arrHelp.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            iconColor: ColorConstants.primary,
            title: Text(
              arrHelp[index].title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              arrHelp[index].shortDescription.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
              trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => {
            launchUrl(Uri.parse(arrHelp[index].path.toString()))
          },
          ),
        );
      },
    );
  }
}
