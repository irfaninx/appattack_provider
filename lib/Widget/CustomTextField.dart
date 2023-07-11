import 'package:flutter/material.dart';

import '../Utility/Constant/color_constant.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.strHintText,
    this.strLabelText,
    this.iconPrefix,
    this.validator,
    this.controller,
    required this.isPassword,
    Key? key,
  }) : super(key: key);

  final String? strHintText;
  final String? strLabelText;
  final Icon? iconPrefix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: iconPrefix,
          hintText: strHintText,
          labelText: strLabelText,
          prefixIconColor: ColorConstants.primary,
          suffixIconColor: ColorConstants.primary,
          hintStyle: TextStyle(color: ColorConstants.primary),
          helperStyle: TextStyle(color: ColorConstants.primary),
          labelStyle: TextStyle(color: ColorConstants.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorConstants.primary,
              width: 2.0,
            ),
          ),
        ));
  }
}
