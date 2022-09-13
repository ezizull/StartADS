// ignore_for_file: non_constant_identifier_names, prefer_final_fields

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
  // variable
  String? isiPesan;

  String? produk;
  String? track;

  String showDialog = '';

  final _customURL = TextEditingController();
  String? customURL;

  List<String> ListProduct = [
    'Gamis Aqila1',
    'Gamis Aqila2',
    'Gamis Aqila3',
    'Gamis Aqila4',
    'Gamis Aqila5'
  ];

  List<Map> listCS = [
    {
      'title': 'Susi Susanti',
      'phone': '082150784267',
      'photo': 'rotator_susi_susanti.png',
    },
    {
      'title': 'Dwi Listya',
      'phone': '082150784267',
      'photo': 'rotator_dwi_listya.png',
    },
    {
      'title': 'Savannah Nguyen',
      'phone': '082150784267',
      'photo': 'rotator_savannah_nguyen.png',
    },
  ];

  @override
  void dispose() {
    _customURL.dispose();
    super.dispose();
  }

  void onTap() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() => showDialog = '');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        appBar: RotatorAppBar(context),
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.only(top: 35),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              Column(
                children: [
                  // Pilih Produk
                  TitleText('Nama Produk'),
                  Button(
                    textBtn: produk ?? 'Pilih Produk',
                    tile: AppIcon.drawer_down,
                    height: 48,
                    textBtnStyle: AppText.Inter14w4_grey_8F9098,
                    margin: const EdgeInsets.only(bottom: 16),
                    onPressed: () => setState(() => showDialog = 'Produk'),
                  ),

                  // Isi Pesan
                  RowButtons(
                    title: 'Isi Pesan',
                    margin: const EdgeInsets.only(bottom: 16),
                    children: [
                      RadioBtn(
                        value: 'Custom Script',
                        groupValue: isiPesan,
                        spacing: 8,
                        width: 150,
                      ),
                      RadioBtn(
                        value: 'Pilih Script',
                        groupValue: isiPesan,
                        spacing: 8,
                        width: 120,
                      ),
                    ],
                  ),

                  // Custom URL
                  TitleText('Custom URL'),
                  InputRotator(
                    hintText: 'Masukan URL (cth: Gamis Aqila)',
                    controller: _customURL,
                    onChanged: (value) => setState(() => customURL = value),
                  ),
                  ErrorMsg(
                    'Wajib Diisi!',
                    margin: const EdgeInsets.only(bottom: 16),
                  ),

                  // Pilih Tracking Option
                  TitleText('Tracking Option'),
                  Button(
                    textBtn: track ?? 'Pilih Tracking Option',
                    height: 48,
                    tile: AppIcon.drawer_down,
                    margin: const EdgeInsets.only(bottom: 16),
                    textBtnStyle: AppText.Inter14w4_grey_8F9098,
                    onPressed: () => setState(() => showDialog = 'Tracking'),
                  ),

                  // Costumer Service
                  TitleText('Customer Service'),
                  Button(
                    textBtn: 'Pilih Customer Service',
                    onPressed: () => BottomModal(context),
                    height: 48,
                    textBtnStyle: AppText.Inter14w4_grey_8F9098,
                  ),

                  // spacing
                  const Expanded(child: SizedBox()),

                  // Simpan
                  Button(
                    btnTextAlgn: Alignment.center,
                    textBtn: 'Simpan',
                    borderWidth: 1.5,
                    height: 48,
                    textBtnStyle: AppText.Inter14w6_grey_8F9098,
                    margin: const EdgeInsets.only(bottom: 34),
                  ),
                ],
              ),

              // Tambah Produk Dialog
              RotatorDialog(popup: showDialog == Produk, top: 23, children: [
                ...ListProduct.map((value) => RotatorDialogItem(value))
              ]),

              // Pilih Tracking Option
              RotatorDialog(
                popup: showDialog == Track,
                top: customURL == '' ? 289 : 274,
                children: [
                  ...ListProduct.map((value) => RotatorDialogItem(value))
                ],
              ),
            ],
          ),
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

  // Dialog of Rotator
  Widget RotatorDialog({
    List<Widget> children = const <Widget>[],
    double? bottom,
    double left = 0,
    double? top,
    double right = 0,
    bool popup = false,
  }) {
    const boxShadow = BoxShadow(
      color: AppColor.grey_C5C6CC,
      blurRadius: 2,
      offset: Offset(0, 1),
    );

    return Positioned(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: FadeScaleMotion(
        alignment: Alignment.topCenter,
        popup: popup,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: const [boxShadow],
              borderRadius: BorderRadius.circular(12)),
          child: Column(children: children),
        ),
      ),
    );
  }

  // Item of Rotator Dialog
  Widget RotatorDialogItem(String value) {
    return GestureDetector(
      onTap: () => setState(() {
        if (showDialog == Produk) produk = value;
        if (showDialog == Track) track = value;
      }),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        color: (showDialog == Produk && produk == value) ||
                (showDialog == Track && track == value)
            ? AppColor.grey_F5F4F6
            : AppColor.transparent,
        child: Text(value),
      ),
    );
  }

  // title in Rotator
  Widget TitleText(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.centerLeft,
      child: Text(title, style: AppText.Inter12w7h14_black_2F3036),
    );
  }

  // Radio Button List
  Widget RowButtons({
    List<Widget> children = const <Widget>[],
    String? title,
    EdgeInsetsGeometry? margin,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          child: Text(title ?? '', style: AppText.Inter12w7h14_black_2F3036),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
        Container(margin: margin)
      ],
    );
  }

  // Radio Button
  Widget RadioBtn({
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
        onChanged: (String? value) => setState(() => isiPesan = value),
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
        onTap: () => setState(() => isiPesan = value),
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

  // Input Textfield
  Widget InputRotator({
    TextEditingController? controller,
    String? hintText,
    Function(String)? onChanged,
    EdgeInsetsGeometry? margin,
  }) {
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

    var inputDecoration = InputDecoration(
      hintStyle: AppText.Inter14w4_grey_8F9098,
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      focusedBorder: customURL != '' ? enableBorder : errorBorder,
      enabledBorder: customURL != '' ? enableBorder : errorBorder,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 48,
      child: TextField(
        controller: controller,
        style: AppText.Inter14w4_black,
        decoration: inputDecoration,
        onChanged: onChanged,
      ),
    );
  }

  Widget ErrorMsg(String text, {EdgeInsets? margin}) {
    return customURL == ''
        ? Container(
            alignment: Alignment.centerLeft,
            margin: margin,
            child: Text(text, style: AppText.Inter12w4_red_FF616D))
        : Container();
  }

  // Add Link Button
  Widget Button({
    Alignment? btnTextAlgn,
    Color? backgroundColor,
    EdgeInsets? padding,
    Function? onPressed,
    double radius = 12,
    BorderSide? side,
    Widget? tile,
    String? textBtn,
    double height = 0,
    ButtonStyle? btnStyle,
    double borderWidth = 1.0,
    TextStyle? textBtnStyle,
    EdgeInsetsGeometry? margin,
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
      minimumSize: Size.fromHeight(height),
      backgroundColor: backgroundColor ?? AppColor.transparent,
    );

    var elevatedButton = ElevatedButton(
      onPressed: (() => onPressed != null ? onPressed() : null),
      style: btnStyle ?? styleFrom,
      child: tile == null
          ? Text(textBtn ?? '', style: textBtnStyle)
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(textBtn ?? '', style: textBtnStyle),
              SizedBox(width: 12, height: 12, child: tile),
            ]),
    );

    return Container(margin: margin, child: elevatedButton);
  }

  // 1 : Add Rotator CS Modal
  Future<dynamic> BottomModal(BuildContext context) {
    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    );

    builder(BuildContext context) {
      double sheight = MediaQuery.of(context).size.height;

      // Choose Rotator CS
      return BottomModalBody(sheight: sheight);
    }

    return showModalBottomSheet(
      context: context,
      shape: shape,
      builder: builder,
    );
  }

  // 2 : Add Rotator CS
  Widget BottomModalBody({double? sheight}) {
    return Container(
      height: sheight! * 0.46,
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
            children: [
              // Cancel button
              GestureDetector(
                child: Text('Cancel', style: AppText.Inter12w6_blue_00AEFF),
              ),

              // Title
              Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

              // Clear all button
              GestureDetector(
                child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
              ),
            ],
          ),
        ),

        //
        BottomModalMain(sheight),

        Button(
          textBtn: 'Pilih',
          height: 40,
          textBtnStyle: AppText.Inter12w6_white,
          btnTextAlgn: Alignment.center,
          backgroundColor: AppColor.blue_00AEFF,
        ),
      ]),
    );
  }

  Widget BottomModalMain(double sheight) {
    const boxDecoration = BoxDecoration(
        border: Border(
      bottom: BorderSide(width: 1.5, color: AppColor.grey_E8EDF0),
    ));

    var titleStyle = AppText.NunitoSans12w6h16_black_464E5F;
    var subtitleStyle = AppText.NunitoSans12w4h14_black_464E5F;

    return Container(
      height: sheight * 0.286,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...listCS.map(
            (e) => Container(
              decoration: boxDecoration,
              height: sheight * 0.095,
              child: ListTile(
                onTap: () {},
                title: Text(e['title'], style: titleStyle),
                subtitle: Text(e['phone'], style: subtitleStyle),
              ),
            ),
          )
        ],
      ),
    );
  }
}
