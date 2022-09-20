// ignore_for_file: non_constant_identifier_names, prefer_final_fields, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/widgets/app_bottom_modal.dart';
import 'package:Scriptmatic/ui/widgets/app_dialog.dart';
import 'package:Scriptmatic/ui/widgets/app_error_message.dart';
import 'package:Scriptmatic/ui/widgets/app_radio_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_appbar.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_input.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_title.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/utils/transitions.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class RotatorAddDefault extends StatefulWidget {
  const RotatorAddDefault({required this.cubit, required this.state}) : super();
  final RotatorCubit cubit;
  final RotatorLoaded state;

  @override
  State<RotatorAddDefault> createState() => _RotatoAddrDefaultState();
}

class _RotatoAddrDefaultState extends State<RotatorAddDefault> {
  // variable
  bool canSubmit = false;

  String? isiPesan;

  String? produk;
  String? track;
  String? customURL;

  String? showDialog;

  final inputCustomURL = TextEditingController();

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
    inputCustomURL.dispose();
    super.dispose();
  }

  void onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => showDialog = '');
  }

  submitVal() {
    if (customURL == null) setState(() => customURL = '');
    if (customURL != '' && canSubmit) AppExt.popScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

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
        appBar: RotatorAppBar(context: context, text: RotatorAdd),
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
                    const RotatorTitle('Isi Pesan'),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RadioButton(
                            spacing: 8,
                            width: 130,
                            text: CustomScript,
                            textStyle: AppText.Pops14w4h21_black_464E5F,
                            radioIcon: isiPesan == CustomScript
                                ? AppIcon.rotator_radio_active
                                : AppIcon.rotator_radio,
                            onTap: () {
                              setState(() => isiPesan = CustomScript);
                              widget.cubit.setRotatorMethod(CustomScript);
                            },
                          ),
                          const SizedBox(width: 32),
                          RadioButton(
                            spacing: 8,
                            width: 130,
                            text: PilihScript,
                            textStyle: AppText.Pops14w4h21_black_464E5F,
                            radioIcon: isiPesan == PilihScript
                                ? AppIcon.rotator_radio_active
                                : AppIcon.rotator_radio,
                            onTap: () {
                              setState(() => isiPesan = PilihScript);
                              widget.cubit.setRotatorMethod(PilihScript);
                            },
                          ),
                        ],
                      ),
                    ),

                    // Custom URL
                    const RotatorTitle(CustomURL),
                    RotatorInput(
                      hintText: 'Masukan URL (cth: Gamis Aqila)',
                      controller: inputCustomURL,
                      height: 48,
                      onChanged: (value) => setState(() => customURL = value),
                      margin: EdgeInsets.only(bottom: customURL == '' ? 8 : 16),
                    ),
                    ErrorMessage(
                      text: 'Wajib Diisi!',
                      showError: customURL == '',
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Pilih Tracking Option
                    const RotatorTitle(Track),
                    RotatorButton(
                      tile: AppIcon.drawer_down,
                      textBtn: track ?? 'Pilih Tracking Option',
                      margin: const EdgeInsets.only(bottom: 16),
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
                      onPressed: () => BottomModal(context, sheight),
                      height: 48,
                      textBtnStyle: AppText.Inter14w4_grey_8F9098,
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Simpan
                    RotatorButton(
                      onPressed: submitVal,
                      textBtn: 'Submit',
                      btnSide: submitSide,
                      height: 48,
                      margin: EdgeInsets.only(top: sheight * 0.275),
                      backgroundColor: canSubmit
                          ? AppColor.blue_00AEFF
                          : AppColor.transparent,
                      textBtnStyle: AppText.Inter14w6_grey_8F9098,
                      btnTextAlgn: Alignment.center,
                    ),
                  ],
                ),

                // Tambah Produk Dialog
                DialogApp(
                    popup: showDialog == Produk,
                    top: 23,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const BoxShadow(
                        color: AppColor.grey_C5C6CC,
                        blurRadius: 2,
                        offset: Offset(0, 1)),
                    children: [
                      ...ListProduct.map((value) => RotatorDialogItem(value))
                    ]),

                // Pilih Tracking Option
                DialogApp(
                  popup: showDialog == Track,
                  top: customURL == '' ? 282 : 257,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const BoxShadow(
                      color: AppColor.grey_C5C6CC,
                      blurRadius: 2,
                      offset: Offset(0, 1)),
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

  Future<dynamic> BottomModal(BuildContext context, double sheight) {
    const boxDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.5, color: AppColor.grey_E8EDF0),
      ),
    );

    var titleStyle = AppText.NunitoSans12w6h16_black_464E5F;
    var subtitleStyle = AppText.NunitoSans12w4h14_black_464E5F;

    const contentPading = EdgeInsets.symmetric(horizontal: 15, vertical: 4);

    return BottomModalApp(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) => ModalApp(
          height: sheight * 0.46,
          mainHeight: sheight * 0.286,
          headers: [
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

            // Button Clear all
            GestureDetector(
              onTap: () {
                setState(() => cboxActive.clear());
                setState(() => _cboxActive.clear());
              },
              child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
            ),
          ],
          items: [
            ...listCS.map(
              (e) {
                var trailing = _cboxActive.contains(e['title'])
                    ? AppIcon.rotator_checkbox_active
                    : AppIcon.rotator_checkbox;

                var leading = CircleAvatar(
                  backgroundImage: AssetImage(e['photo']),
                );

                return Container(
                  alignment: Alignment.centerLeft,
                  decoration: boxDecoration,
                  child: ListTile(
                    onTap: () {
                      if (_cboxActive.contains(e['title'])) {
                        setState(() => _cboxActive.remove(e['title']));
                      } else {
                        setState(() => _cboxActive.add(e['title']));
                      }
                    },
                    title: Text(e['title'], style: titleStyle),
                    subtitle: Text(e['phone'], style: subtitleStyle),
                    contentPadding: contentPading,
                    trailing: trailing,
                    leading: leading,
                  ),
                );
              },
            )
          ],
          submitBtn: RotatorButton(
            textBtnStyle: AppText.Inter12w6_white,
            textBtn: 'Pilih',
            height: 40,
            onPressed: () {
              setState(() => cboxActive = List.from(_cboxActive));
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pop(context);
            },
            btnTextAlgn: Alignment.center,
            backgroundColor: AppColor.blue_00AEFF,
          ),
        ),
      ),
    );
  }

  // Item of Rotator Dialog
  Widget RotatorDialogItem(String value) {
    var color = (showDialog == Produk && produk == value) ||
            (showDialog == Track && track == value)
        ? AppColor.grey_F5F4F6
        : AppColor.transparent;

    return DialogItemApp(
      height: 48,
      color: color,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () => setState(() {
        if (showDialog == Produk) produk = value;
        if (showDialog == Track) track = value;
      }),
      text: value,
    );
  }
}
