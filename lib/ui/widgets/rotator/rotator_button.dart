import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;

class RotatorButton extends StatelessWidget {
  const RotatorButton({
    Key? key,
    this.btnSide,
    this.borderWidth = 1,
    this.onPressed,
    this.padding,
    this.btnTextAlgn,
    this.backgroundColor = AppColor.white,
    this.foregroundColor = AppColor.transparent,
    this.radius = 12,
    required this.height,
    this.tile,
    this.child,
    this.textBtn = '',
    this.showButton = true,
    this.textBtnStyle,
    this.margin = const EdgeInsets.only(bottom: 16),
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
  final Widget? tile;
  final Widget? child;
  final String textBtn;
  final bool showButton;
  final TextStyle? textBtnStyle;
  final EdgeInsets? margin;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    var defSide = BorderSide(
      width: borderWidth,
      color: AppColor.grey_C5C6CC,
      style: BorderStyle.solid,
    );

    var defShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: defSide,
    );

    var styleFrom = ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      shadowColor: shadowColor,
      shape: defShape,
      padding: padding,
      alignment: btnTextAlgn ?? Alignment.centerLeft,
      minimumSize: Size.fromHeight(height),
      backgroundColor: backgroundColor,
    );

    var localText = Text(textBtn, style: textBtnStyle);
    var locaChild = child ??
        (tile == null
            ? localText
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  localText,
                  SizedBox(width: 12, height: 12, child: tile),
                ],
              ));

    var elevatedButton = ElevatedButton(
      onPressed: (() => onPressed != null ? onPressed!() : null),
      style: styleFrom,
      child: locaChild,
    );

    return showButton
        ? Container(margin: margin, child: elevatedButton)
        : Container();
  }
}
