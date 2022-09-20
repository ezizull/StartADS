import 'package:flutter/material.dart';
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
    this.margin,
    this.style,
    required this.text,
    required this.showError,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final EdgeInsets? margin;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    if (showError) {
      return Container(
        alignment: Alignment.centerLeft,
        margin: margin,
        child: Text(text, style: style ?? AppText.Inter12w4_red_FF616D),
      );
    } else {
      return Container();
    }
  }
}
