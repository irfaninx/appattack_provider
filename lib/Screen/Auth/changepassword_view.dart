import 'package:appattack_provider/Utility/validation_extension.dart';
import 'package:flutter/material.dart';

import '../../Utility/Constant/alert_constant.dart';
import '../../Utility/Constant/color_constant.dart';
import '../../Widget/CustomTextField.dart';
import '../Tabbar/home_view.dart';

class changepassword_view extends StatefulWidget {
  const changepassword_view({super.key});

  @override
  State<changepassword_view> createState() => _changepassword_viewState();
}

class _changepassword_viewState extends State<changepassword_view> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(),
        title: const Text("Change Password"),
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
                  strHintText: "CURRENT PASSWORD",
                  // ignore: prefer_const_constructors
                  strLabelText: "CURRENT PASSWORD",
                  iconPrefix: Icon(Icons.lock),
                  validator: (val) {
                    if (val!.isEmpty)
                      return AlertMessage.enterOldPassword;
                    else if (!val.isValidPassword)
                      return AlertMessage.invalidPassword;
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  strHintText: "NEW PASSWORD",
                  // ignore: prefer_const_constructors
                  strLabelText: "NEW PASSWORD", iconPrefix: Icon(Icons.lock),
                  controller: _pass,
                  validator: (val) {
                    if (val!.isEmpty)
                      return AlertMessage.enterNewPassword;
                    else if (!val.isValidPassword)
                      return AlertMessage.invalidPassword;
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  strHintText: "CONFIRM PASSWORD",
                  // ignore: prefer_const_constructors
                  strLabelText: "CONFIRM PASSWORD",
                  iconPrefix: Icon(Icons.lock),
                  controller: _confirmPass,
                  validator: (val) {
                    if (val!.isEmpty)
                      return AlertMessage.enterConfirmPassword;
                    else if (val != _pass.text)
                      return AlertMessage.mismatchPassword;
                    return null;
                  },
                  isPassword: true,
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
