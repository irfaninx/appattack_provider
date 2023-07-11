import 'package:appattack_provider/Utility/SharePreferance/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Model/selectcollegemodel.dart';
import '../Utility/Constant/color_constant.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  CollegeData objcollege = CollegeData();
  void initState() {
    super.initState();
    _getCollegeData();
  }

  _getCollegeData() async {
    try {
      Map<String, dynamic> tmpcollegeJson =
          await shared_preferences.shared.ClassValuesSF("college");

      setState(() {
        objcollege = CollegeData.fromJson(tmpcollegeJson);
      });
    } catch (Excepetion) {
      print("college not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: ListTile(
        leading: CircleAvatar(
          radius: 20, // Image radius
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(0), // Border radius
            child: ClipOval(
              child: CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: ColorConstants.primary,
                ),
                imageUrl: objcollege.collegeUrl ?? "",
              ),
            ),
          ),
        ),
        title: Text(
          (objcollege.collegeName ?? "").toUpperCase(),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
