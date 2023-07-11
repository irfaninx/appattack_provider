import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Utility/validation_extension.dart';
import 'package:flutter/material.dart';

import '../../Utility/Constant/alert_constant.dart';
import '../../Widget/CustomTextField.dart';

class forgotpassword_view extends StatefulWidget {
  const forgotpassword_view({super.key});

  @override
  State<forgotpassword_view> createState() => _forgotpassword_viewState();
}

class _forgotpassword_viewState extends State<forgotpassword_view> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Forgot Password"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Please enter your registered Email ID, We will send you Reset Password link to your registered email id.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    strHintText: "EMAIL",
                    strLabelText: "EMAIL",
                    iconPrefix: Icon(Icons.email),
                    validator: (val) {
                      if (val!.isEmpty)
                        return AlertMessage.enterMail;
                      else if (!val.isValidEmail)
                        return AlertMessage.invalidMail;
                      return null;
                    },
                    isPassword: false,
                  ),
                  SizedBox(
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
                          "SUBMIT",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
