// ignore_for_file: non_constant_identifier_names, prefer_final_fields,  curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors, unused_import

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_default.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/rotator_add_screen.dart';
import 'package:Scriptmatic/ui/widgets/app_bottom_modal.dart';
import 'package:Scriptmatic/ui/widgets/app_dialog.dart';
import 'package:Scriptmatic/ui/widgets/app_message.dart';
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
  RotatorAddCustomScript({
    required this.cubit,
    required this.state,
    this.baseCbox = const [[]],
  }) : super();

  final RotatorCubit cubit;
  final RotatorLoaded state;
  List<dynamic> baseCbox;

  @override
  State<RotatorAddCustomScript> createState() => _RotatorAddCustomScriptState();
}

class _RotatorAddCustomScriptState extends State<RotatorAddCustomScript> {
  // variable
  bool showBobot = false;
  bool canSubmit = false;

  String? isiPesan = CustomScript;

  String? customISI;
  String? customURL;
  String? produk;
  String? track;
  String? group;
  List<String> bobot = [];
  String? pixelID;
  String? showDialog;

  final customUrlCtrl = TextEditingController();
  final isiPesanCtrl = TextEditingController();
  final pixelIdCtrl = TextEditingController();
  List<TextEditingController> bobotCtrl = [];

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

  List<dynamic> cboxActive = [[]];
  List<String> cboxActiveTmp = [];

  @override
  void initState() {
    if (widget.baseCbox.isNotEmpty) cboxActive = List.from(widget.baseCbox);
    super.initState();
  }

  @override
  void dispose() {
    customUrlCtrl.dispose();
    isiPesanCtrl.dispose();
    pixelIdCtrl.dispose();
    for (var element in bobotCtrl) element.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

    debugPrint(cboxActive.toString());

    setState(() {
      bobotCtrl = List.generate(
        cboxActive.length,
        (index) => TextEditingController(),
      );

      var bool = customURL != '' &&
          widget.baseCbox.isNotEmpty &&
          track != '' &&
          produk != '' &&
          customISI != '' &&
          group != '' &&
          pixelID != '' &&
          bobot.isNotEmpty;

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() => showDialog = '');
      },
      child: Scaffold(
        appBar: RotatorAppBar(
          text: 'Tambah Link Rotator',
          context: context,
          onTap: () {
            AppExt.pushAndRemoveScreen(
              context,
              pageRef: const RotatorAddScreen(),
            );
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
                              widget.cubit
                                  .setRotatorMethod(param: CustomScript);
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
                              widget.cubit.setRotatorMethod(param: PilihScript);
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
                      onError: customISI == '',
                      onChanged: (value) => setState(() => customISI = value),
                      margin: EdgeInsets.only(bottom: customISI == '' ? 8 : 16),
                    ),
                    AppMessage(
                      text: 'Wajib Diisi!',
                      showMsg: customISI == '',
                      margin: const EdgeInsets.only(bottom: 16),
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
                    AppMessage(
                      text: 'Wajib Diisi!',
                      showMsg: customURL == '',
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Pilih Tracking Option
                    const RotatorTitle(Track),
                    RotatorButton(
                      textBtn: track ?? 'Pilih Tracking Option',
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 16),
                      tile: AppIcon.drawer_down,
                      textBtnStyle: track != null
                          ? AppText.Inter14w4_black
                          : AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = Track),
                    ),

                    // Custom URL
                    const RotatorTitle(PixelID),
                    RotatorInput(
                      controller: pixelIdCtrl,
                      hintText: 'XXXXXX',
                      onError: pixelID == '',
                      onChanged: (value) => setState(() => pixelID = value),
                      margin: EdgeInsets.only(bottom: pixelID == '' ? 8 : 16),
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [UpperCaseText()],
                    ),
                    AppMessage(
                      text: 'Wajib Diisi!',
                      showMsg: pixelID == '',
                      margin: const EdgeInsets.only(bottom: 16),
                    ),

                    // Pilih Tracking Option
                    RotatorTitle(GroubPel, showTitle: isiPesan == CustomScript),
                    RotatorButton(
                      textBtn: group ?? 'New Costumer',
                      height: 48,
                      tile: AppIcon.drawer_down,
                      margin: const EdgeInsets.only(bottom: 16),
                      textBtnStyle: group != null
                          ? AppText.Inter14w4_black
                          : AppText.Inter14w4_grey_8F9098,
                      onPressed: () => setState(() => showDialog = GroubPel),
                    ),

                    // Costumer Service
                    for (var index = 0; index < cboxActive.length; index++) ...[
                      const RotatorTitle('Customer Service'),
                      RotatorButton(
                        textBtn: cboxActive[index].isNotEmpty
                            ? cboxActive[index].join(', ')
                            : 'Pilih Customer Service',
                        onPressed: () =>
                            BottomModal(context, sheight, index: index),
                        height: 48,
                        textBtnStyle: cboxActive[index].isNotEmpty
                            ? AppText.Inter14w4_black
                            : AppText.Inter14w4_grey_8F9098,
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
                        controller: bobotCtrl[index],
                        onError: bobot.isNotEmpty,
                        onChanged: (value) =>
                            setState(() => bobot[index] = value),
                        margin: const EdgeInsets.only(bottom: 16),
                      ),
                    ],

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
                      onPressed: () {
                        setState(() => cboxActive.add([]));
                      },
                      btnTextAlgn: Alignment.center,
                      height: 48,
                      foregroundColor: AppColor.blue_00AEFF,
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
                      onPressed: () {
                        if (customURL == null) setState(() => customURL = '');
                        if (customURL != '' && canSubmit)
                          AppExt.popScreen(context);
                      },
                      textBtn: 'Submit',
                      btnSide: submitSide,
                      height: 48,
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
                    top: 23,
                    popup: showDialog == Produk,
                    borderRadius: BorderRadius.circular(12),
                    children: [
                      ...ListProduct.map((value) => RotatorDialogItem(value))
                    ]),

                // Pilih Tracking Option
                DialogApp(
                  top: 393,
                  changePos: [customISI == '', customURL == '', pixelID == ''],
                  popup: showDialog == Track,
                  borderRadius: BorderRadius.circular(12),
                  children: [
                    ...ListProduct.map((value) => RotatorDialogItem(value))
                  ],
                ),

                // Group Pelanggan
                DialogApp(
                  top: 567,
                  changePos: [customISI == '', customURL == '', pixelID == ''],
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

  // Bottom Modal
  Future<dynamic> BottomModal(
    BuildContext context,
    double sheight, {
    required int index,
  }) {
    if (cboxActive.isEmpty) {
      cboxActiveTmp = List.from([]);
    } else {
      cboxActiveTmp = List.from(cboxActive[index]);
    }

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
                setState(() => cboxActiveTmp = List.from(cboxActive));
                Navigator.pop(context);
              },
            ),

            // Title
            Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

            // Button Clear all
            GestureDetector(
              onTap: () {
                setState(() => cboxActive[index] = []);
                setState(() => cboxActiveTmp.clear());

                AppExt.pushScreen(
                  context,
                  RotatorAddCustomScript(
                    cubit: widget.cubit,
                    state: widget.state,
                    baseCbox: cboxActive,
                  ),
                  AppExt.RouteTransition.fade,
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
              setState(() => cboxActive[index] = List.from(cboxActiveTmp));
              AppExt.pushScreen(
                context,
                RotatorAddCustomScript(
                  cubit: widget.cubit,
                  state: widget.state,
                  baseCbox: cboxActive,
                ),
                AppExt.RouteTransition.fade,
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
    var validate = (showDialog == Produk && produk == value) ||
        (showDialog == Track && track == value) ||
        (showDialog == GroubPel && group == value);

    var color = validate ? AppColor.grey_F5F4F6 : AppColor.transparent;

    return DialogItemApp(
      height: 48,
      color: color,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () => setState(() {
        if (showDialog == Produk) produk = value;
        if (showDialog == Track) track = value;
        if (showDialog == GroubPel) group = value;
      }),
      text: value,
    );
  }
}
