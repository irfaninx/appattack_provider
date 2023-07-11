import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Utility/validation_extension.dart';
import 'package:flutter/material.dart';

import '../../Utility/Constant/alert_constant.dart';
import '../../Widget/CustomTextField.dart';
import '../Tabbar/home_view.dart';

class register_view extends StatefulWidget {
  const register_view({super.key});

  @override
  State<register_view> createState() => _register_viewState();
}

class _register_viewState extends State<register_view> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(),
        title: const Text("Register"),
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
                CustomTextField(
                  strHintText: "PASSWORD",
                  // ignore: prefer_const_constructors
                  strLabelText: "PASSWORD", iconPrefix: Icon(Icons.lock),
                  controller: _pass,
                  validator: (val) {
                    if (val!.isEmpty)
                      return AlertMessage.enterPassword;
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
                      return AlertMessage.mismatchPassword2;
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ALREADY HAVE AN ACCOUNT?"),
                    TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                ColorConstants.primary)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: ColorConstants.primary,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                        "SIGN UP",
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
