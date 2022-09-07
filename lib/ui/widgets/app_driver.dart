// ignore_for_file: use_key_in_widget_constructors

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;

// Devider Widget
class AppDivider extends StatelessWidget {
  const AppDivider({Key? key, this.height = 1, this.margin, this.color})
      : super(key: key);

  final double height;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? AppColor.white_D4D6DD,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}
