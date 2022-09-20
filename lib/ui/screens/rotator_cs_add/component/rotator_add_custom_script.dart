// ignore_for_file: non_constant_identifier_names, prefer_final_fields,  curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors, unused_import

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/widgets/app_bottom_modal.dart';
import 'package:Scriptmatic/ui/widgets/app_dialog.dart';
import 'package:Scriptmatic/ui/widgets/app_error_message.dart';
import 'package:Scriptmatic/ui/widgets/app_informat.dart';
import 'package:Scriptmatic/ui/widgets/app_radio_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_appbar.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_input.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_title.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class RotatorAddCustomScript extends StatefulWidget {
  const RotatorAddCustomScript({required this.cubit, required this.state})
      : super();
  final RotatorCubit cubit;
  final RotatorState state;

  @override
  State<RotatorAddCustomScript> createState() => _RotatorAddCustomScriptState();
}

class _RotatorAddCustomScriptState extends State<RotatorAddCustomScript> {
  // variable
  bool showBobot = false;
  bool canSubmit = false;

  String? isiPesan;

  String? customISI;
  String? customURL;
  String? produk;
  String? track;
  String? group;
  String? bobot;
  String? pixelID;
  String? showDialog;

  final customUrlCtrl = TextEditingController();
  final isiPesanCtrl = TextEditingController();
  final pixelIdCtrl = TextEditingController();
  final bobotCtrl = TextEditingController();

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

  double grubDialog = 0;
  double topSimpan = 0;

  @override
  void dispose() {
    customUrlCtrl.dispose();
    bobotCtrl.dispose();
    isiPesanCtrl.dispose();
    pixelIdCtrl.dispose();
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
      // Group Dialog
      if (customURL == '' && pixelID == '') {
        grubDialog = 615;
      } else if (customURL != '' && pixelID != '') {
        grubDialog = 576;
      } else {
        grubDialog = 591;
      }

      // Simpan Button
      topSimpan = sheight * 0.29;

      var bool = customURL != '' &&
          cboxActive.isNotEmpty &&
          track != '' &&
          produk != '' &&
          customISI != '' &&
          group != '' &&
          pixelID != '' &&
          bobot != '';

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

    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        appBar: RotatorAppBar(
          text: 'Edit Link Rotator',
          context: context,
          onTap: () => widget.cubit.setRotatorMethod(''),
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

                    // custom script
                    const RotatorTitle(CustomISI),
                    RotatorInput(
                      hintText: 'Masukan isi pesan',
                      controller: isiPesanCtrl,
                      height: 97,
                      maxLines: 5,
                      onChanged: (value) => setState(() => customISI = value),
                      margin: EdgeInsets.only(bottom: customISI == '' ? 8 : 16),
                    ),

                    // Custom URL
                    const RotatorTitle(CustomURL),
                    RotatorInput(
                      hintText: 'Masukan URL (cth: Gamis Aqila)',
                      controller: customUrlCtrl,
                      onError: customURL == '',
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
                      textBtn: track ?? 'Pilih Tracking Option',
                      margin: const EdgeInsets.only(bottom: 16),
                      tile: AppIcon.drawer_down,
                      height: 48,
                      textBtnStyle: AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = Track),
                    ),

                    // Custom URL
                    const RotatorTitle(PixelID),
                    RotatorInput(
                      controller: pixelIdCtrl,
                      hintText: 'XXXXXX',
                      onChanged: (value) => setState(() => pixelID = value),
                      margin: EdgeInsets.only(bottom: pixelID == '' ? 8 : 16),
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [UpperCaseText()],
                    ),
                    ErrorMessage(
                      text: 'Wajib Diisi!',
                      showError: pixelID == '',
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Pilih Tracking Option
                    RotatorTitle(GroubPel, showTitle: isiPesan == CustomScript),
                    RotatorButton(
                      textBtn: group ?? 'New Costumer',
                      height: 48,
                      tile: AppIcon.drawer_down,
                      showButton: isiPesan == CustomScript,
                      margin: const EdgeInsets.only(bottom: 16),
                      textBtnStyle: AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = GroubPel),
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

                    // Bobot
                    RotatorTitle(
                      'Bobot',
                      onTap: () => setState(() => showBobot = !showBobot),
                      icon: AppIcon.rotator_info,
                    ),
                    RotatorInput(
                      hintText: '1',
                      height: 48,
                      controller: bobotCtrl,
                      onError: bobotCtrl.text.isNotEmpty,
                      margin: const EdgeInsets.only(bottom: 16),
                      onChanged: ((value) => setState(() => bobot = value)),
                    ),

                    // Show Info
                    RotatorButton(
                      borderWidth: 0,
                      height: 172,
                      showButton: showBobot,
                      margin: const EdgeInsets.only(bottom: 16),
                      backgroundColor: AppColor.blue_EAF2FF,
                      foregroundColor: AppColor.blue_00AEFF,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            margin: const EdgeInsets.only(right: 16),
                            child: AppIcon.rotator_info_show,
                          ),
                          Expanded(
                              child: Text(
                            'Bobot bukan lah persentase melainkan pola,\n'
                            'contoh:\n'
                            ' • CS A -> Bobot 3\n'
                            ' • CS B -> Bobot 2\n'
                            'Artinya CS A akan menerima 3 pesan, kemudian setelah 3 pesan secara berurutan akan merotasi ke CS B, dst.',
                            style: AppText.Inter_12w4h20_orange_FF8C51,
                          )),
                        ],
                      ),
                    ),

                    // Tambah Customer Service
                    RotatorButton(
                      textBtn: 'Tambah Customer Service +',
                      onPressed: () => BottomModal(context, sheight),
                      btnTextAlgn: Alignment.center,
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 35),
                      textBtnStyle: AppText.Inter14w4h20_blue_00AEFF,
                      btnSide: const BorderSide(
                        width: 1.5,
                        color: AppColor.blue_00AEFF,
                        style: BorderStyle.solid,
                      ),
                    ),

                    // Simpan
                    RotatorButton(
                      onPressed: submitVal,
                      textBtn: 'Submit',
                      btnSide: submitSide,
                      height: 48,
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
                  top: customURL != '' ? 394 : 417,
                  popup: showDialog == Track,
                  borderRadius: BorderRadius.circular(12),
                  children: [
                    ...ListProduct.map((value) => RotatorDialogItem(value))
                  ],
                ),

                // Group Pelanggan
                DialogApp(
                  top: grubDialog,
                  popup: showDialog == GroubPel,
                  borderRadius: BorderRadius.circular(12),
                  children: [
                    ...ListProduct.map((value) => RotatorDialogItem(value))
                  ],
                ),
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
