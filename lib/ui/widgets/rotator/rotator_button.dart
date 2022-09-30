import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;

class RotatorButton extends StatelessWidget {
  RotatorButton({
    Key? key,
    this.btnSide,
    this.borderWidth = 1,
    this.onPressed,
    this.padding,
    this.btnTextAlgn,
    this.backgroundColor = AppColor.transparent,
    this.foregroundColor = AppColor.grey_E5E5E5,
    this.radius = 12,
    this.height = 40,
    this.tile,
    this.child,
    this.textBtn = '',
    this.showButton = true,
    this.textBtnStyle,
    this.width = 0,
    this.margin,
    this.shadowColor = AppColor.transparent,
  }) : super(key: key);

  final BorderSide? btnSide;
  final double borderWidth;
  final Function? onPressed;
  final EdgeInsets? padding;
  final Alignment? btnTextAlgn;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double radius;
  final double height;
  double width;
  final Widget? tile;
  final Widget? child;
  final String textBtn;
  final bool showButton;
  final TextStyle? textBtnStyle;
  final EdgeInsets? margin;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    if (width == 0) width = MediaQuery.of(context).size.width;

    var defSide = BorderSide(
      width: borderWidth,
      color: AppColor.grey_C5C6CC,
      style: BorderStyle.solid,
    );

    var defShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: btnSide ?? defSide,
    );

    var styleFrom = ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      shadowColor: shadowColor,
      shape: defShape,
      padding: padding,
      alignment: btnTextAlgn ?? Alignment.centerLeft,
      fixedSize: Size(width, height),
      backgroundColor: backgroundColor,
    );

    var localText = Text(textBtn, style: textBtnStyle);
    var localChild = child ??
        (tile == null
            ? localText
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  localText,
                  tile ?? Container(),
                ],
              ));

    var elevatedButton = ElevatedButton(
      onPressed: (() => onPressed != null ? onPressed!() : null),
      style: styleFrom,
      child: localChild,
    );

    return showButton
        ? Container(padding: margin, child: elevatedButton)
        : Container();
  }
}
