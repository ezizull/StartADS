// ignore_for_file: non_constant_identifier_names

import 'package:Scriptmatic/ui/widgets/rotator/rotator_button.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

// Bottom Modal App
Future<dynamic> BottomModalApp({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  ShapeBorder? shape,
}) {
  const defShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
  );

  // Modal Bottom
  return showModalBottomSheet(
    context: context,
    shape: shape ?? defShape,
    builder: builder,
  );
}

// Modal App
Widget ModalApp({
  List<Widget> children = const <Widget>[],
  Function? onSubmit,
  double height = 0,
  double mainHeight = 0,
  List<Widget> headers = const <Widget>[],
  List<Widget> items = const <Widget>[],
  RotatorButton? submitBtn,
}) {
  return Container(
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Column(children: [
      // icons
      Container(
        height: 6,
        width: 38,
        margin: const EdgeInsets.symmetric(vertical: 13),
        child: AppIcon.dashboard_bottom_dialog_put,
      ),

      // header
      Container(
        height: 27,
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: headers,
        ),
      ),

      Container(
        height: mainHeight,
        margin: const EdgeInsets.only(bottom: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: items,
        ),
      ),

      Container(child: submitBtn),
    ]),
  );
}
