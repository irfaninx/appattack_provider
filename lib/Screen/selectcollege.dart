import 'package:appattack_provider/Provider/select_college_provider.dart';
import 'package:appattack_provider/Screen/Auth/login_view.dart';
import 'package:appattack_provider/Utility/Constant/app_constant.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Utility/SharePreferance/shared_preferences.dart';
import 'package:appattack_provider/Utility/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/selectcollegemodel.dart';
import '../Widget/CustomProgressView.dart';
import 'Tabbar/tabbar.dart';

class selectcollege extends StatefulWidget {
  const selectcollege({super.key});

  @override
  State<selectcollege> createState() => _selectcollegeState();
}

class _selectcollegeState extends State<selectcollege> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SelectCollegeProvider>(context, listen: false).getCollege();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appName),
      ),
      body: Consumer<SelectCollegeProvider>(
        builder: (context,value,child) {
          if (value.isLoading) {
            return const Center(
              child: CustomProgressView(),
            );
          }  else {
            return _buildPosts(context, value.arrCollege);
          }
        },
      ),
    );
  }

  ListView _buildPosts(BuildContext context, List<CollegeData> posts) {
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
                    imageUrl: posts[index].collegeUrl.toString(),
                  ),
                ),
              ),
            ),
            title: Text(
              posts[index].collegeName.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              shared_preferences.shared.setClassToSF("college", posts[index].toJson()),
              shared_preferences.shared.setStringToSF(UserDefaultKeys.collageID.toString(), posts[index].collegeID ?? ""),
              if (posts[index].isLoginRequired == 1)
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const login_view()))
                }
              else
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => tabbar(
                            objcollege: posts[index],
                          )))
                }
            },
          ),
        );
      },
    );
  }
}
