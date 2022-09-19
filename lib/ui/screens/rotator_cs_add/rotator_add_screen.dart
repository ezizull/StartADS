// ignore_for_file: non_constant_identifier_names, prefer_final_fields, curly_braces_in_flow_control_structures, unrelated_type_equality_checks

import 'package:Scriptmatic/ui/widgets/rotator/rotator_appbar.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_input.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_title.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/utils/transitions.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class RotatorAddScreen extends StatefulWidget {
  const RotatorAddScreen({Key? key}) : super(key: key);

  @override
  State<RotatorAddScreen> createState() => _RotatorAddScreenState();
}

class _RotatorAddScreenState extends State<RotatorAddScreen> {
  // variable
  bool bobotInfo = false;
  bool canSubmit = false;

  String infoShow = 'Bobot bukan lah persentase melainkan pola,\n'
      'contoh:\n'
      ' • CS A -> Bobot 3\n'
      ' • CS B -> Bobot 2\n'
      'Artinya CS A akan menerima 3 pesan, kemudian setelah 3 pesan secara berurutan akan merotasi ke CS B, dst.';

  String? isiPesan;

  String? produk;
  String? track;
  String? group;
  String? bobot;

  String? customURL;
  String? customISI;
  String? pixelID;

  String showDialog = '';
  double? grubDialog;

  double topSimpan = 0;

  final _customURL = TextEditingController();

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
      'photo': 'assets/images/rotator/rotator_add/rotator_susi_susanti.png',
    },
    {
      'title': 'Dwi Listya',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_dwi_listya.png',
    },
    {
      'title': 'Savannah Nguyen',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_savannah_nguyen.png',
    },
  ];

  List<String> cboxActive = [];
  List<String> _cboxActive = [];

  @override
  void dispose() {
    // _customURL.dispose();
    super.dispose();
  }

  void onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => showDialog = '');
  }

  submitVal() {
    if (customURL == null) setState(() => customURL = '');
    if (customURL != '') AppExt.popScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      var bool = customURL != '' &&
          cboxActive.isNotEmpty &&
          track != '' &&
          produk != '';

      if (bool) canSubmit = true;
      if (!bool) canSubmit = false;
    });

    BorderSide submitSide;
    if (canSubmit) {
      submitSide = const BorderSide();
    } else {
      submitSide = const BorderSide(
        width: 1,
        color: AppColor.grey_C5C6CC,
        style: BorderStyle.solid,
      );
    }

    // return Screen
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        appBar: RotatorAppBar(context: context),
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Pilih Produk
                    const RotatorTitle(Produk),
                    RotatorButton(
                      textBtn: produk ?? 'Pilih Produk',
                      height: 48,
                      tile: AppIcon.drawer_down,
                      textBtnStyle: AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = Produk),
                      btnSide: const BorderSide(
                        width: 1,
                        color: AppColor.grey_C5C6CC,
                        style: BorderStyle.solid,
                      ),
                    ),

                    // Isi Pesan
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RotatorTitle('Isi Pesan'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RadioBtn(
                              value: CustomScript,
                              groupValue: isiPesan,
                              spacing: 8,
                              width: 150,
                            ),
                            RadioBtn(
                              value: PilihScript,
                              groupValue: isiPesan,
                              spacing: 8,
                              width: 120,
                            ),
                          ],
                        ),
                        Container(margin: const EdgeInsets.only(bottom: 16))
                      ],
                    ),

                    // Custom URL
                    const RotatorTitle(CustomURL),
                    RotatorInput(
                      hintText: 'Masukan URL (cth: Gamis Aqila)',
                      controller: _customURL,
                      height: 48,
                      onChanged: (value) => setState(() => customURL = value),
                      margin: EdgeInsets.only(bottom: customURL == '' ? 8 : 16),
                    ),
                    ErrorMsg(
                      'Wajib Diisi!',
                      initial: CustomURL,
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Pilih Tracking Option
                    const RotatorTitle(Track),
                    RotatorButton(
                      textBtn: track ?? 'Pilih Tracking Option',
                      margin: const EdgeInsets.only(bottom: 16),
                      tile: AppIcon.drawer_down,
                      height: 48,
                      textBtnStyle: AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = Track),
                    ),

                    // Costumer Service
                    const RotatorTitle('Customer Service'),
                    RotatorButton(
                      textBtn: cboxActive.isNotEmpty
                          ? cboxActive.join(', ')
                          : 'Pilih Customer Service',
                      onPressed: () => BottomModal(context),
                      height: 48,
                      textBtnStyle: AppText.Inter14w4_grey_8F9098,
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Simpan
                    RotatorButton(
                      onPressed: submitVal,
                      textBtn: 'Submit',
                      height: 48,
                      btnSide: submitSide,
                      backgroundColor: canSubmit
                          ? AppColor.blue_00AEFF
                          : AppColor.transparent,
                      textBtnStyle: AppText.Inter14w6_grey_8F9098,
                      btnTextAlgn: Alignment.center,
                    ),
                  ],
                ),

                // Tambah Produk Dialog
                RotatorDialog(popup: showDialog == Produk, top: 23, children: [
                  ...ListProduct.map((value) => RotatorDialogItem(value))
                ]),

                // Pilih Tracking Option
                RotatorDialog(
                  top: customURL == '' ? 283 : 260,
                  popup: showDialog == Track,
                  children: [
                    ...ListProduct.map((value) => RotatorDialogItem(value))
                  ],
                ),

                // End Stack
              ],
            ),
          ],
        ),
      ),
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
    var color = (showDialog == Produk && produk == value) ||
            (showDialog == Track && track == value) ||
            (showDialog == GroubPel && group == value)
        ? AppColor.grey_F5F4F6
        : AppColor.transparent;

    return GestureDetector(
      onTap: () => setState(() {
        if (showDialog == Produk) produk = value;
        if (showDialog == Track) track = value;
        if (showDialog == GroubPel) group = value;
      }),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        color: color,
        child: Text(value),
      ),
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

  Widget ErrorMsg(
    String text, {
    required String initial,
    EdgeInsets? margin,
    bool showMessage = true,
  }) {
    if (showMessage) {
      if (customURL == '' && initial == CustomURL) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: margin,
          child: Text(text, style: AppText.Inter12w4_red_FF616D),
        );
      }
      if (pixelID == '' && initial == PixelID) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: margin,
          child: Text(text, style: AppText.Inter12w4_red_FF616D),
        );
      }

      return Container();
    }

    return Container();
  }

  // 1 : Add Rotator CS Modal
  Future<dynamic> BottomModal(BuildContext context) {
    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    );

    // function
    builder(BuildContext context) {
      double sheight = MediaQuery.of(context).size.height;

      // Choose Rotator CS
      return StatefulBuilder(builder: (context, setState) {
        return BottomModalBody(setState, sheight: sheight);
      });
    }

    return showModalBottomSheet(
      context: context,
      shape: shape,
      builder: builder,
    );
  }

  // 2 : Add Rotator CS
  Widget BottomModalBody(var setState, {double? sheight}) {
    debugPrint(cboxActive.toString());
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
                onTap: () {
                  setState(() => _cboxActive = List.from(cboxActive));
                  Navigator.pop(context);
                },
              ),

              // Title
              Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

              // Clear all button
              GestureDetector(
                onTap: () {
                  setState(() => cboxActive.clear());
                  setState(() => _cboxActive.clear());
                },
                child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
              ),
            ],
          ),
        ),

        // main
        BottomModalMain(setState, sheight),

        RotatorButton(
          textBtnStyle: AppText.Inter12w6_white,
          textBtn: 'Pilih',
          height: 40,
          onPressed: () {
            setState(() => cboxActive = List.from(_cboxActive));
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(FocusNode());
          },
          btnTextAlgn: Alignment.center,
          backgroundColor: AppColor.blue_00AEFF,
        ),
      ]),
    );
  }

  // 2 : Add Rotator CS
  Widget BottomModalMain(var setState, double sheight) {
    const boxDecoration = BoxDecoration(
        border: Border(
      bottom: BorderSide(width: 1.5, color: AppColor.grey_E8EDF0),
    ));

    var titleStyle = AppText.NunitoSans12w6h16_black_464E5F;
    var subtitleStyle = AppText.NunitoSans12w4h14_black_464E5F;

    const contentPading = EdgeInsets.symmetric(horizontal: 15, vertical: 4);

    return Container(
      height: sheight * 0.286,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...listCS.map(
            (e) {
              var trailing = _cboxActive.contains(e['title'])
                  ? AppIcon.rotator_checkbox_active
                  : AppIcon.rotator_checkbox;

              var leading = CircleAvatar(
                backgroundImage: AssetImage(e['photo']),
              );

              return Container(
                decoration: boxDecoration,
                alignment: Alignment.centerLeft,
                child: ListTile(
                  onTap: () {
                    if (_cboxActive.contains(e['title'])) {
                      setState(() => _cboxActive.remove(e['title']));
                    } else {
                      setState(() => _cboxActive.add(e['title']));
                    }
                  },
                  contentPadding: contentPading,
                  leading: leading,
                  title: Text(e['title'], style: titleStyle),
                  subtitle: Text(e['phone'], style: subtitleStyle),
                  trailing: trailing,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
