// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:Scriptmatic/utils/transitions.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class DialogApp extends StatelessWidget {
  const DialogApp({
    Key? key,
    required this.popup,
    this.bottom,
    this.left = 0,
    this.right = 0,
    this.top,
    this.clipBehavior = Clip.hardEdge,
    this.color = AppColor.white,
    this.borderRadius,
    this.boxShadow,
    this.btwDialog = 22,
    this.listVal = const [],
    this.children = const [],
    this.alignment = Alignment.topCenter,
  }) : super(key: key);

  final List<Widget> children;
  final double? bottom;
  final double left;
  final double? top;
  final double right;
  final bool popup;
  final BorderRadius? borderRadius;
  final Alignment alignment;
  final Clip clipBehavior;
  final Color? color;
  final BoxShadow? boxShadow;
  final double btwDialog;
  final List<bool> listVal;

  double? dialogPos(double? value) {
    for (bool val in listVal) {
      if (value != null && val) value += btwDialog;
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    const defBoxShadow = BoxShadow(
      color: AppColor.grey_C5C6CC,
      blurRadius: 2,
      offset: Offset(0, 1),
    );

    if (popup) {
      return Positioned(
        right: right,
        left: left,
        top: dialogPos(top),
        bottom: bottom,
        child: FadeScaleMotion(
          alignment: alignment,
          popup: popup,
          child: Container(
            child: Column(children: children),
            clipBehavior: clipBehavior,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [boxShadow ?? defBoxShadow],
              borderRadius: borderRadius,
            ),
          ),
        ),
      );
    }

    return Container();
  }
}

class DialogItemApp extends StatelessWidget {
  DialogItemApp({
    this.onTap,
    this.color,
    this.height,
    this.text = '',
    this.padding,
    this.child,
    this.alignment,
    this.decoration,
    this.margin,
    this.clipBehavior = Clip.none,
  }) : super();

  final Color? color;
  final EdgeInsets? padding;
  final Alignment? alignment;
  final Function()? onTap;
  final String text;
  final double? height;
  final Widget? child;
  final Decoration? decoration;
  final EdgeInsets? margin;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        color: color,
        height: height,
        clipBehavior: clipBehavior,
        decoration: decoration,
        margin: margin,
        padding: padding,
        child: child ?? Text(text),
      ),
    );
  }
}
