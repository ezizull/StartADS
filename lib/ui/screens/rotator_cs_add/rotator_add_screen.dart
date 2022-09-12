// ignore_for_file: non_constant_identifier_names

import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/utils/transitions.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:flutter/services.dart';

class RotatorAddScreen extends StatefulWidget {
  const RotatorAddScreen({Key? key}) : super(key: key);

  @override
  State<RotatorAddScreen> createState() => _RotatorAddScreenState();
}

class _RotatorAddScreenState extends State<RotatorAddScreen> {
  late TextEditingController customCtrl;
  String? pesan;

  List<String> ListProduct = [
    'Gamis Aqila1',
    'Gamis Aqila2',
    'Gamis Aqila3',
    'Gamis Aqila4',
    'Gamis Aqila5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RotatorAppBar(context),
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            //
            AddLink(
              title: 'Nama Produk',
              textBtn: 'Pilih Produk',
              sectionMargin: const EdgeInsets.only(bottom: 16),
              textBtnStyle: AppText.Inter14w4_grey_8F9098,
              tile: AppIcon.drawer_down,
            ),

            RadioRotatorList(children: [
              RadioRotator(
                value: 'Custom Script',
                groupValue: pesan,
                spacing: 8,
                width: 150,
              ),
              RadioRotator(
                value: 'Pilih Script',
                groupValue: pesan,
                spacing: 8,
                width: 120,
              ),
            ]),

            // Custom URL
            InputRotator(
              text: 'Custom URL',
              sectionMargin: const EdgeInsets.only(bottom: 16),
            ),

            //
            AddLink(
              title: 'Tracking Option',
              textBtn: 'Pilih Tracking Option',
              sectionMargin: const EdgeInsets.only(bottom: 16),
              textBtnStyle: AppText.Inter14w4_grey_8F9098,
              tile: AppIcon.drawer_down,
            ),

            // Costumer Service
            AddLink(
              title: 'Customer Service',
              textBtn: 'Pilih Customer Service',
              sectionMargin: const EdgeInsets.only(bottom: 16),
              textBtnStyle: AppText.Inter14w4_grey_8F9098,
            ),

            // spacing
            const Expanded(child: SizedBox()),

            //
            AddLink(
              btnTextAlgn: Alignment.center,
              textBtn: 'Simpan',
              borderWidth: 1.5,
              sectionMargin: const EdgeInsets.only(bottom: 34),
              textBtnStyle: AppText.Inter14w6_grey_8F9098,
            ),
          ],
        ),
      ),
    );
  }

  // Rotator AppBar
  AppBar RotatorAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      leading: GestureDetector(
        onTap: () => AppExt.popScreen(context),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          color: AppColor.transparent,
          child: AppIcon.package_left_button,
        ),
      ),
      title: Text(RotatorAdd, style: AppText.Inter16w7_black_1F2024),
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0, // 1
    );
  }

  // Radio Button List
  Widget RadioRotatorList({List<Widget> children = const <Widget>[]}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Isi Pesan',
              style: AppText.Inter12w7h14_black_2F3036,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ],
      ),
    );
  }

  // Radio Button
  Widget RadioRotator({
    required String? groupValue,
    required String value,
    EdgeInsetsGeometry? margin,
    double width = 130,
    double spacing = 10,
    Color? color,
  }) {
    // component
    var children = [
      Radio(
        onChanged: (String? value) => setState(() => pesan = value),
        groupValue: groupValue,
        value: value,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ),
      SizedBox(width: spacing),
      Flexible(
          child: GestureDetector(
        onTap: () => setState(() => pesan = value),
        child: Text(value, style: AppText.Pops14w4h21_black_464E5F),
      )),
    ];

    return Container(
      color: color,
      width: width,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }

  // Dialog of each Content Script
  Widget RotatorDialog(int index) {
    return Positioned(
      top: 5,
      right: 5,
      child: FadeScaleMotion(
        alignment: Alignment.topCenter,
        popup: false,
        child: Container(
          width: 124,
          decoration: const BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(color: AppColor.black_272727),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [],
          ),
        ),
      ),
    );
  }

  // Input Textfield
  Widget InputRotator({
    TextEditingController? controller,
    String? text,
    bool required = false,
    Function(String)? onChanged,
    EdgeInsetsGeometry? sectionMargin,
  }) {
    const enableBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
          width: 1, color: AppColor.grey_C5C6CC, style: BorderStyle.solid),
    );

    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
          width: 1, color: AppColor.red_FF616D, style: BorderStyle.solid),
    );

    var inputDecoration = InputDecoration(
      hintStyle: AppText.Inter14w4_grey_8F9098,
      hintText: 'Masukan URL',
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      focusedBorder: enableBorder,
      enabledBorder: enableBorder,
      errorBorder: errorBorder,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(text ?? '', style: AppText.Inter12w7h14_black_2F3036)),

        // input
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 48,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(24)),
          child: TextField(
            controller: controller,
            style: AppText.Inter14w4_black,
            decoration: inputDecoration,
            onChanged: onChanged,
          ),
        ),

        // message
        Visibility(
          visible: true,
          child: Text('Wajib Diisi!', style: AppText.Inter12w4_red_FF616D),
        ),

        // margin bottom
        Container(
          margin: sectionMargin,
        )
      ],
    );
  }

  // Add Link Button
  Widget AddLink({
    AlignmentGeometry? btnTextAlgn,
    Color? backgroundColor,
    List<Widget>? children,
    EdgeInsets? padding,
    Function? onPressed,
    double radius = 12,
    BorderSide? side,
    Widget? tile,
    String? title,
    String? textBtn,
    double borderWidth = 1.0,
    TextStyle? textBtnStyle,
    EdgeInsetsGeometry? sectionMargin,
  }) {
    var shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: BorderSide(
        width: borderWidth,
        color: AppColor.grey_C5C6CC,
        style: BorderStyle.solid,
      ),
    );

    var styleFrom = ElevatedButton.styleFrom(
      foregroundColor: AppColor.white_D4D6DD,
      shadowColor: AppColor.transparent,
      shape: shape,
      side: side,
      padding: padding,
      alignment: btnTextAlgn ?? Alignment.centerLeft,
      minimumSize: const Size.fromHeight(48),
      backgroundColor: backgroundColor ?? AppColor.transparent,
    );

    var elevatedButton = ElevatedButton(
      onPressed: (() => onPressed != null ? onPressed() : null),
      style: styleFrom,
      child: tile == null
          ? Text(textBtn ?? '', style: textBtnStyle)
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(textBtn ?? '', style: textBtnStyle),
              SizedBox(width: 12, height: 12, child: tile),
            ]),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title section
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(title ?? '', style: AppText.Inter12w7h14_black_2F3036),
        ),

        // button
        Container(
          child: elevatedButton,
        ),

        Container(
          margin: sectionMargin,
        ),
      ],
    );
  }
}
