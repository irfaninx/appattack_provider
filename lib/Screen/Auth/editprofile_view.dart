import 'package:appattack_provider/Utility/validation_extension.dart';
import 'package:flutter/material.dart';

import '../../Utility/Constant/alert_constant.dart';
import '../../Utility/Constant/color_constant.dart';
import '../../Widget/CustomTextField.dart';
import '../Tabbar/home_view.dart';

class editprofile_view extends StatefulWidget {
  const editprofile_view({super.key});

  @override
  State<editprofile_view> createState() => _editprofile_viewState();
}

class _editprofile_viewState extends State<editprofile_view> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(),
        title: const Text("Edit Profile"),
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  strHintText: "FIRST NAME",
                  strLabelText: "FIRST NAME",
                  iconPrefix: Icon(Icons.person),
                  validator: (val) {
                    if (val!.isEmpty) return AlertMessage.enterName;
                    return null;
                  },
                  isPassword: false,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  strHintText: "LAST NAME",
                  strLabelText: "LAST NAME",
                  iconPrefix: Icon(Icons.person),
                  validator: (val) {
                    if (val!.isEmpty) return AlertMessage.enterLastName;
                    return null;
                  },
                  isPassword: false,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  strHintText: "EMAIL",
                  strLabelText: "EMAIL",
                  iconPrefix: Icon(Icons.email),
                  validator: (val) {
                    if (val!.isEmpty)
                      return AlertMessage.enterMail;
                    else if (!val.isValidEmail) return AlertMessage.invalidMail;
                    return null;
                  },
                  isPassword: false,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  strHintText: "CITY",
                  strLabelText: "CITY",
                  iconPrefix: Icon(Icons.location_city),
                  validator: (val) {
                    if (val!.isEmpty) return AlertMessage.enterCity;
                    return null;
                  },
                  isPassword: false,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    // if use media query, then will not work for nested widgets.
                    width: double.infinity,
                    height:
                        50, //Or use 'width: MediaQuery.of(context).size.width'
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorConstants.primary)),
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const home_view()));
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
