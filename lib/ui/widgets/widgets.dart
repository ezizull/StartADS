import 'package:flutter/material.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key, this.height = 1}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColor.white_D4D6DD,
      margin: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}
