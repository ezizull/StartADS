// ignore_for_file: non_constant_identifier_names, prefer_final_fields, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs/rotator_screen.dart';
import 'package:Scriptmatic/ui/widgets/app_bottom_modal.dart';
import 'package:Scriptmatic/ui/widgets/app_dialog.dart';
import 'package:Scriptmatic/ui/widgets/app_message.dart';
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
  RotatorAddDefault({
    required this.cubit,
    required this.state,
    this.cboxActive = const [],
  }) : super();

  final RotatorCubit cubit;
  final RotatorLoaded state;
  List<dynamic> cboxActive;

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

  List<String> cboxActiveTmp = [];

  Map pilihScript = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.state.pilihScript.isNotEmpty) {
        // pilih script status
        isiPesan = PilihScript;

        // pilih script data
        pilihScript = widget.state.pilihScript;

        debugPrint(pilihScript.toString());
      }
    });
  }

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
          widget.cboxActive.isNotEmpty &&
          track != '' &&
          produk != '';

      if (bool) canSubmit = true;
      if (!bool) canSubmit = false;
    });

    BorderSide submitSide;
    if (canSubmit) {
      submitSide = const BorderSide(color: AppColor.transparent);
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
        appBar: RotatorAppBar(
          context: context,
          text: RotatorAdd,
          onTap: () {
            AppExt.pushAndRemoveScreen(context, pageRef: const RotatorScreen());
          },
        ),
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
                      textBtnStyle: produk != null
                          ? AppText.Inter14w4_black
                          : AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = Produk),
                      margin: const EdgeInsets.only(bottom: 16),
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
                              widget.cubit.setRotatorMethod(
                                param: CustomScript,
                              );
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
                              widget.cubit.setRotatorMethod(
                                param: PilihScript,
                                pilihScript: widget.state.pilihScript,
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Pilih Script
                    RotatorTitle(
                      PilihScript,
                      showTitle: isiPesan == PilihScript,
                    ),
                    RotatorButton(
                      showButton: isiPesan == PilihScript,
                      textBtn: pilihScript['title'] ?? '',
                      height: 48,
                      textBtnStyle: AppText.Inter14w4_black,
                      margin: const EdgeInsets.only(bottom: 8),
                      tile: InkWell(
                        onTap: () => widget.cubit.setRotatorMethod(
                          param: PilihScript,
                          pilihScript: widget.state.pilihScript,
                        ),
                        child: Text(
                          'Ganti',
                          style: AppText.Inter12w7h12_blue_00AEFF,
                        ),
                      ),
                    ),
                    AppMessage(
                      text: pilihScript['status'] ?? '',
                      showMsg: isiPesan == PilihScript,
                      prefixIcon: pilihScript['status'] == 'Preview'
                          ? SizedBox(
                              height: 12, child: AppIcon.rotator_eye_preview)
                          : SizedBox(
                              height: 12, child: AppIcon.rotator_eye_close),
                      textStyle: pilihScript['status'] == 'Preview'
                          ? AppText.Inter12w6h14_blue_00AEFF
                          : AppText.Inter12w4_red_FF616D,
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Custom URL
                    const RotatorTitle(CustomURL),
                    RotatorInput(
                      hintText: 'Masukan URL (cth: Gamis Aqila)',
                      controller: inputCustomURL,
                      height: 48,
                      onError: customURL == '',
                      onChanged: (value) => setState(() => customURL = value),
                      margin: EdgeInsets.only(bottom: customURL == '' ? 8 : 16),
                    ),
                    AppMessage(
                      text: 'Wajib Diisi!',
                      showMsg: customURL == '',
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Pilih Tracking Option
                    const RotatorTitle(Track),
                    RotatorButton(
                      tile: AppIcon.drawer_down,
                      textBtn: track ?? 'Pilih Tracking Option',
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 48,
                      textBtnStyle: track != null
                          ? AppText.Inter14w4_black
                          : AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = Track),
                    ),

                    // Costumer Service
                    const RotatorTitle('Customer Service'),
                    RotatorButton(
                      textBtn: widget.cboxActive.isNotEmpty
                          ? widget.cboxActive.join(', ')
                          : 'Pilih Customer Service',
                      onPressed: () => BottomModal(context, sheight),
                      height: 48,
                      textBtnStyle: widget.cboxActive.isNotEmpty
                          ? AppText.Inter14w4_black
                          : AppText.Inter14w4_grey_8F9098,
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Simpan
                    RotatorButton(
                      onPressed: submitVal,
                      textBtn: 'Submit',
                      btnSide: submitSide,
                      height: 48,
                      margin: isiPesan == PilihScript
                          ? EdgeInsets.only(top: sheight * 0.15)
                          : EdgeInsets.only(top: sheight * 0.275),
                      backgroundColor: canSubmit
                          ? AppColor.blue_00AEFF
                          : AppColor.transparent,
                      textBtnStyle: canSubmit
                          ? AppText.Inter14w6_white
                          : AppText.Inter14w6_grey_8F9098,
                      btnTextAlgn: Alignment.center,
                    ),
                  ],
                ),

                // Tambah Produk Dialog
                DialogApp(
                    popup: showDialog == Produk,
                    top: 23,
                    borderRadius: BorderRadius.circular(12),
                    children: [
                      ...ListProduct.map((value) => RotatorDialogItem(value))
                    ]),

                // Pilih Tracking Option
                DialogApp(
                  popup: showDialog == Track,
                  top: 257,
                  changePos: [customURL == ''],
                  borderRadius: BorderRadius.circular(12),
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
    cboxActiveTmp = List.from(widget.cboxActive);

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
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => ModalApp(
          height: sheight * 0.46,
          mainHeight: sheight * 0.286,
          headers: [
            // Cancel button
            GestureDetector(
              child: Text('Cancel', style: AppText.Inter12w6_blue_00AEFF),
              onTap: () {
                setState(() => cboxActiveTmp = List.from(widget.cboxActive));
                Navigator.pop(context);
              },
            ),

            // Title
            Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

            // Button Clear all
            GestureDetector(
              onTap: () {
                setState(() => widget.cboxActive.clear());
                setState(() => cboxActiveTmp.clear());
                AppExt.pushAndRemoveScreen(
                  context,
                  pageRef: RotatorAddDefault(
                    cubit: widget.cubit,
                    state: widget.state,
                    cboxActive: widget.cboxActive,
                  ),
                );
              },
              child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
            ),
          ],
          items: [
            ...listCS.map(
              (e) {
                var trailing = cboxActiveTmp.contains(e['title'])
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
                      if (cboxActiveTmp.contains(e['title'])) {
                        setState(() => cboxActiveTmp.remove(e['title']));
                      } else {
                        setState(() => cboxActiveTmp.add(e['title']));
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
              setState(() => widget.cboxActive = List.from(cboxActiveTmp));
              AppExt.pushAndRemoveScreen(
                context,
                pageRef: RotatorAddDefault(
                  cubit: widget.cubit,
                  state: widget.state,
                  cboxActive: widget.cboxActive,
                ),
              );
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
