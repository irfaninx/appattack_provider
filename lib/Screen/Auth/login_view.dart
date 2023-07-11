import 'package:appattack_provider/Screen/Auth/register_view.dart';
import 'package:appattack_provider/Utility/Constant/alert_constant.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Utility/validation_extension.dart';
import 'package:flutter/material.dart';

import '../../Widget/CustomTextField.dart';
import '../purchase_view.dart';
import 'forgotpassword_view.dart';

class login_view extends StatefulWidget {
  const login_view({super.key});

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Login"),
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
                      height: 25,
                    ),
                    CustomTextField(
                      strHintText: "PASSWORD",
                      // ignore: prefer_const_constructors
                      strLabelText: "PASSWORD",
                      iconPrefix: Icon(Icons.password),
                      validator: (val) {
                        if (val!.isEmpty)
                          return AlertMessage.enterPassword;
                        else if (!val.isValidPassword)
                          return AlertMessage.invalidPassword;

                        return null;
                      },
                      isPassword: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  ColorConstants.primary)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const forgotpassword_view()));
                          },
                          child: const Text(
                            "FORGOT PASSWORD?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => const home_view()));
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const purchase_view()));

                            }
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("DON'T HAVE A ACCOUNT?"),
                        TextButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(
                                    ColorConstants.primary)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const register_view()));
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: ColorConstants.primary,
                                fontSize: 16,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
