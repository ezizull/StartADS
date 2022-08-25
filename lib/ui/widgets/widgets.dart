import 'package:flutter/material.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColor.line,
      margin: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}
