import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
    this.radioIcon,
    this.widthIcon = 16,
    this.heightIcon = 16,
    this.margin,
    this.padding,
    this.onTap,
    this.text = '',
    this.width = 100,
    this.spacing = 8,
    this.textStyle,
  }) : super(key: key);

  final Widget? radioIcon;
  final double? widthIcon;
  final double? heightIcon;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function()? onTap;
  final String text;
  final double width;
  final double spacing;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // component
    var children = [
      SizedBox(
        width: widthIcon,
        height: heightIcon,
        child: radioIcon,
      ),
      SizedBox(width: spacing),
      Flexible(child: Text(text, style: textStyle)),
    ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: margin,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
