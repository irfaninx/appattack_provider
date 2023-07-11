
import 'package:flutter/material.dart';

import '../Utility/Constant/color_constant.dart';

class CustomProgressView extends StatelessWidget {
  const CustomProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorConstants.primary,
    );
  }
}
