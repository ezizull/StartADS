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
import 'package:flutter_bloc/flutter_bloc.dart';

class RotatorAddCustomScript extends StatefulWidget {
  const RotatorAddCustomScript({required this.cubit, required this.state})
      : super();

  final RotatorCubit cubit;
  final RotatorLoaded state;

  @override
  State<RotatorAddCustomScript> createState() => _RotatorAddCustomScriptState();
}

class _RotatorAddCustomScriptState extends State<RotatorAddCustomScript> {
  @override
  void initState() {
    widget.cubit.multipleRotator = List.generate(3, (index) => []);
    widget.cubit.controllerRotator =
        List.generate(3, (index) => TextEditingController());

    widget.cubit.contentsRotator = List.generate(6, (index) => null);
    widget.cubit.conditionRotator = List.generate(2, (index) => false);

    // checkbox, listbobot, listcontroller
    widget.cubit.multipleRotator[0] = List.generate(1, (index) => []);
    widget.cubit.multipleRotator[1] =
        List.generate(1, (index) => null.toString());
    widget.cubit.multipleRotator[2] =
        List.generate(1, (index) => TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RotatorCubit>(
      create: (context) => RotatorCubit(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<RotatorCubit, RotatorState>(
              bloc: widget.cubit,
              listener: (context, state) {
                if (state is RotatorLoaded) {
                  debugPrint("SUKSES FETCH");
                }
                if (state is RotatorFailure) {
                  debugPrint("GAGAL FETCH :" + state.message);
                }
              }),
        ],
        child: BlocBuilder<RotatorCubit, RotatorState>(
          bloc: widget.cubit,
          builder: (context, state) {
            if (state is RotatorLoaded) {
              return GestureDetector(
                onTap: () => {
                  AppExt.hideKeyboard(context),
                  setState(() => widget.cubit.showDialog = ''),
                },
                child: Scaffold(
                  appBar: RotatorAppBar(
                    text: 'Tambah Link Rotator',
                    context: context,
                    onTap: () => widget.cubit.setRotatorMethod(),
                  ),
                  backgroundColor: AppColor.white,
                  resizeToAvoidBottomInset: false,
                  body: BodyRotator(context, widget.cubit, state),
                ),
              );
            }
            return const Scaffold(
              backgroundColor: AppColor.white,
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget BodyRotator(
    BuildContext context,
    RotatorCubit cubit,
    RotatorLoaded state,
  ) {
    double sheight = MediaQuery.of(context).size.height;

    var checkBox = cubit.multipleRotator[0];
    List<String?> listBobot = cubit.multipleRotator[1];
    var listBobotController = cubit.multipleRotator[2];

    var canSubmit = cubit.conditionRotator[0];
    canSubmit = cubit.conditionTrue &&
        cubit.multipleTrue &&
        cubit.contentsTrue &&
        cubit.controllerTrue;

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

    return ListView(
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
                  textBtn: cubit.contentsRotator[0] ?? 'Pilih Produk',
                  height: 48,
                  tile: AppIcon.drawer_down,
                  textBtnStyle: cubit.contentsRotator[0] != null
                      ? AppText.Inter14w4_black
                      : AppText.Inter14w4_grey_8F9098,
                  onPressed: () => setState(() => cubit.showDialog = Produk),
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
                        radioIcon: AppIcon.rotator_radio_active,
                        onTap: () {
                          widget.cubit.setRotatorMethod(param: CustomScript);
                        },
                      ),
                      const SizedBox(width: 32),
                      RadioButton(
                        spacing: 8,
                        width: 130,
                        text: PilihScript,
                        textStyle: AppText.Pops14w4h21_black_464E5F,
                        radioIcon: AppIcon.rotator_radio,
                        onTap: () {
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
                  controller: cubit.controllerRotator[0],
                  height: 97,
                  maxLines: 5,
                  onError: cubit.contentsRotator[1] == '',
                  onChanged: (value) =>
                      setState(() => cubit.contentsRotator[1] = value),
                  margin: EdgeInsets.only(
                      bottom: cubit.contentsRotator[1] == '' ? 8 : 16),
                ),
                AppMessage(
                  text: 'Wajib Diisi!',
                  showMsg: cubit.contentsRotator[1] == '',
                  margin: const EdgeInsets.only(bottom: 16),
                ),

                // Custom URL
                const RotatorTitle(CustomURL),
                RotatorInput(
                  hintText: 'Masukan URL (cth: Gamis Aqila)',
                  controller: cubit.controllerRotator[1],
                  onError: cubit.contentsRotator[2] == '',
                  onChanged: (value) =>
                      setState(() => cubit.contentsRotator[2] = value),
                  margin: EdgeInsets.only(
                      bottom: cubit.contentsRotator[2] == '' ? 8 : 16),
                ),
                AppMessage(
                  text: 'Wajib Diisi!',
                  showMsg: cubit.contentsRotator[2] == '',
                  margin: const EdgeInsets.only(bottom: 16),
                ),

                // Pilih Tracking Option
                const RotatorTitle(Track),
                RotatorButton(
                  textBtn: cubit.contentsRotator[3] ?? 'Pilih Tracking Option',
                  height: 48,
                  margin: const EdgeInsets.only(bottom: 16),
                  tile: AppIcon.drawer_down,
                  textBtnStyle: cubit.contentsRotator[3] != null
                      ? AppText.Inter14w4_black
                      : AppText.Inter14w4_grey_8F9098,
                  onPressed: () => setState(() => cubit.showDialog = Track),
                ),

                // Custom URL
                const RotatorTitle(PixelID),
                RotatorInput(
                  controller: cubit.controllerRotator[2],
                  hintText: 'XXXXXX',
                  onError: cubit.contentsRotator[4] == '',
                  onChanged: (value) =>
                      setState(() => cubit.contentsRotator[4] = value),
                  margin: EdgeInsets.only(
                      bottom: cubit.contentsRotator[4] == '' ? 8 : 16),
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [UpperCaseText()],
                ),
                AppMessage(
                  text: 'Wajib Diisi!',
                  showMsg: cubit.contentsRotator[4] == '',
                  margin: const EdgeInsets.only(bottom: 16),
                ),

                // Pilih Grub Pelanggan
                const RotatorTitle(GroubPel),
                RotatorButton(
                  textBtn: cubit.contentsRotator[5] ?? 'New Costumer',
                  height: 48,
                  tile: AppIcon.drawer_down,
                  margin: const EdgeInsets.only(bottom: 16),
                  textBtnStyle: cubit.contentsRotator[5] != null
                      ? AppText.Inter14w4_black
                      : AppText.Inter14w4_grey_8F9098,
                  onPressed: () => setState(() => cubit.showDialog = GroubPel),
                ),

                // Costumer Service
                for (var index = 0; index < checkBox.length; index++) ...[
                  const RotatorTitle('Customer Service'),
                  RotatorButton(
                    textBtn: checkBox[index].isNotEmpty
                        ? checkBox[index].join(', ')
                        : 'Pilih Customer Service',
                    onPressed: () => BottomModal(context, index),
                    height: 48,
                    textBtnStyle: checkBox[index].isNotEmpty
                        ? AppText.Inter14w4_black
                        : AppText.Inter14w4_grey_8F9098,
                    margin: const EdgeInsets.only(bottom: 16),
                  ),

                  // Bobot
                  RotatorTitle(
                    'Bobot',
                    onTap: () => setState(() =>
                        cubit.conditionRotator[1] = !cubit.conditionRotator[1]),
                    icon: AppIcon.rotator_info,
                  ),
                  RotatorInput(
                    hintText: '1',
                    height: 48,
                    controller: listBobotController[index],
                    onError: listBobot[index] == '',
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) => {
                      setState(() => cubit.multipleRotator[1][index] = value),
                    },
                    margin: EdgeInsets.only(
                      bottom: listBobot[index] == '' ? 8 : 16,
                    ),
                  ),
                  AppMessage(
                    text: 'Wajib Diisi!',
                    showMsg: listBobot[index] == '',
                    margin: const EdgeInsets.only(bottom: 16),
                  ),
                ],

                // Show Info
                RotatorButton(
                  borderWidth: 0,
                  height: 172,
                  showButton: cubit.conditionRotator[1],
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
                  onPressed: () => {
                    setState(() {
                      cubit.multipleRotator[2].add(TextEditingController());
                      cubit.multipleRotator[1].add(null.toString());
                      cubit.multipleRotator[0].add([]);
                    }),
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
                    if (canSubmit) AppExt.popScreen(context);
                  },
                  textBtn: 'Submit',
                  btnSide: submitSide,
                  height: 48,
                  backgroundColor:
                      canSubmit ? AppColor.blue_00AEFF : AppColor.transparent,
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
                popup: cubit.showDialog == Produk,
                borderRadius: BorderRadius.circular(12),
                children: [
                  ...cubit.listProduct.map(
                    (value) => DialogItemApp(
                      text: value,
                      height: 48,
                      color: cubit.showDialog == Produk &&
                              cubit.contentsRotator[0] == value
                          ? AppColor.grey_F5F4F6
                          : AppColor.transparent,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      onTap: () =>
                          setState(() => cubit.contentsRotator[0] = value),
                    ),
                  )
                ]),

            // Pilih Tracking Option
            DialogApp(
              top: 393,
              changePos: [
                cubit.contentsRotator[1] == '',
                cubit.contentsRotator[2] == ''
              ],
              popup: cubit.showDialog == Track,
              borderRadius: BorderRadius.circular(12),
              children: [
                ...cubit.listProduct.map(
                  (value) => DialogItemApp(
                    text: value,
                    height: 48,
                    color: cubit.showDialog == Track &&
                            cubit.contentsRotator[3] == value
                        ? AppColor.grey_F5F4F6
                        : AppColor.transparent,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onTap: () =>
                        setState(() => cubit.contentsRotator[3] = value),
                  ),
                )
              ],
            ),

            // Group Pelanggan
            DialogApp(
              top: 567,
              changePos: [
                cubit.contentsRotator[1] == '',
                cubit.contentsRotator[2] == '',
                cubit.contentsRotator[4] == ''
              ],
              popup: cubit.showDialog == GroubPel,
              borderRadius: BorderRadius.circular(12),
              children: [
                ...cubit.listProduct.map(
                  (value) => DialogItemApp(
                    text: value,
                    height: 48,
                    color: cubit.showDialog == GroubPel &&
                            cubit.contentsRotator[5] == value
                        ? AppColor.grey_F5F4F6
                        : AppColor.transparent,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onTap: () =>
                        setState(() => cubit.contentsRotator[5] = value),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Bottom Modal
  Future<dynamic> BottomModal(BuildContext context, int index) {
    double sheight = MediaQuery.of(context).size.height;

    List<String> cboxActiveTmp =
        List.from(widget.cubit.multipleRotator[0][index]);

    return BottomModalApp(
      context: context,
      builder: (BuildContext context) => ModalApp(
        height: sheight * 0.46,
        mainHeight: sheight * 0.286,
        headers: [
          // Cancel button
          GestureDetector(
            child: Text('Cancel', style: AppText.Inter12w6_blue_00AEFF),
            onTap: () {
              setState(() => cboxActiveTmp =
                  List.from(widget.cubit.multipleRotator[0][index]));
              AppExt.popScreen(context);
            },
          ),

          // Title
          Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

          // Button Clear all
          GestureDetector(
            onTap: () {
              setState(() => widget.cubit.multipleRotator[0][index] = []);
              setState(() => cboxActiveTmp.clear());
              AppExt.popScreen(context);
            },
            child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
          ),
        ],
        items: [
          ...widget.cubit.listCS.map(
            (e) {
              return StatefulBuilder(builder: (context, setState) {
                return Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      width: 1.5,
                      color: AppColor.grey_E8EDF0,
                    )),
                  ),
                  child: ListTile(
                    onTap: () {
                      if (cboxActiveTmp.contains(e['title'])) {
                        setState(() => cboxActiveTmp.remove(e['title']));
                      } else {
                        setState(() => cboxActiveTmp.add(e['title']));
                      }
                    },
                    title: Text(e['title'],
                        style: AppText.NunitoSans12w6h16_black_464E5F),
                    subtitle: Text(e['phone'],
                        style: AppText.NunitoSans12w4h14_black_464E5F),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    trailing: cboxActiveTmp.contains(e['title'])
                        ? AppIcon.rotator_checkbox_active
                        : AppIcon.rotator_checkbox,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(e['photo']),
                    ),
                  ),
                );
              });
            },
          )
        ],
        submitBtn: RotatorButton(
          textBtnStyle: AppText.Inter12w6_white,
          textBtn: 'Pilih',
          height: 40,
          onPressed: () => {
            setState(() => widget.cubit.multipleRotator[0][index] =
                List.from(cboxActiveTmp)),
            AppExt.popScreen(context),
          },
          btnTextAlgn: Alignment.center,
          backgroundColor: AppColor.blue_00AEFF,
        ),
      ),
    );
  }
}
