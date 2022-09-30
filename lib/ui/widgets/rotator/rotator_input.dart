import 'package:Scriptmatic/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:flutter/services.dart';

class RotatorInput extends StatelessWidget {
  const RotatorInput({
    Key? key,
    this.onChanged,
    this.inputFormatters,
    required this.controller,
    this.showButton = true,
    this.hintText,
    this.maxLines = 1,
    this.height,
    this.margin,
    this.prefixIcon,
    this.suffixIcon,
    this.onError = false,
    this.textCapitalization,
  }) : super(key: key);

  final void Function(String value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final bool showButton;
  final bool onError;
  final String? hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final EdgeInsets? margin;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    const enableBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.grey_C5C6CC,
        style: BorderStyle.solid,
      ),
    );

    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.red_FF616D,
        style: BorderStyle.solid,
      ),
    );

    InputBorder border() {
      if (onError) return errorBorder;
      return enableBorder;
    }

    // debugPrint(onError.toString());

    var inputDecoration = InputDecoration(
      hintStyle: AppText.Inter14w4_grey_8F9098,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      focusedBorder: border(),
      enabledBorder: border(),
    );

    if (showButton) {
      return Container(
        margin: margin,
        height: height,
        child: TextField(
          keyboardType: TextInputType.text,
          controller: controller,
          style: AppText.Inter14w4_black,
          maxLines: maxLines,
          decoration: inputDecoration,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
        ),
      );
    } else {
      return Container();
    }
  }
}
