import 'package:flutter/material.dart';
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class AppMessage extends StatelessWidget {
  const AppMessage({
    Key? key,
    this.margin,
    this.textStyle,
    this.prefixIcon,
    required this.text,
    required this.showMsg,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final bool showMsg;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    if (showMsg) {
      var children = [
        prefixIcon ?? Container(),
        Text(text, style: textStyle ?? AppText.Inter12w4_red_FF616D),
      ];

      return Container(
        alignment: Alignment.centerLeft,
        margin: margin,
        child: prefixIcon != null
            ? Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: children,
              )
            : Text(text, style: textStyle ?? AppText.Inter12w4_red_FF616D),
      );
    } else {
      return Container();
    }
  }
}
