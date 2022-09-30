// ignore_for_file: non_constant_identifier_names, prefer_final_fields, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs/rotator_screen.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_custom_script.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_pilih_script.dart';
import 'package:Scriptmatic/ui/widgets/app_bottom_modal.dart';
import 'package:Scriptmatic/ui/widgets/app_dialog.dart';
import 'package:Scriptmatic/ui/widgets/app_message.dart';
import 'package:Scriptmatic/ui/widgets/app_radio_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_appbar.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_input.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_title.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:flutter_bloc/flutter_bloc.dart';

class RotatorAddDefault extends StatefulWidget {
  const RotatorAddDefault({required this.cubit, required this.state}) : super();

  final RotatorCubit cubit;
  final RotatorLoaded state;

  @override
  State<RotatorAddDefault> createState() => _RotatoAddrDefaultState();
}

class _RotatoAddrDefaultState extends State<RotatorAddDefault> {
  @override
  void initState() {
    widget.cubit.contentsRotator = List.generate(3, (index) => null);
    widget.cubit.choicesRotator = List.generate(1, (index) => []);
    widget.cubit.conditionRotator = List.generate(1, (index) => false);
    widget.cubit.controllerRotator =
        List.generate(1, (index) => TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    widget.cubit.dispose();
    super.dispose();
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
                  appBar: RotatorAppBar(context: context, text: RotatorAdd),
                  backgroundColor: AppColor.white,
                  resizeToAvoidBottomInset: false,
                  body: BodyRotator(context, widget.cubit, widget.state),
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

    var canSubmit = cubit.conditionRotator[0];
    canSubmit = cubit.conditionTrue && cubit.choisesTrue && cubit.contentsTrue;

    debugPrint(cubit.choicesRotator[0].toString());

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
                  onPressed: () => setState((() => cubit.showDialog = Produk)),
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
                        radioIcon: AppIcon.rotator_radio,
                        onTap: () {
                          cubit.setRotatorMethod(param: CustomScript);
                        },
                      ),
                      const SizedBox(width: 32),
                      RadioButton(
                        spacing: 8,
                        width: 130,
                        text: PilihScript,
                        textStyle: AppText.Pops14w4h21_black_464E5F,
                        radioIcon: state.pilihScript.isNotEmpty
                            ? AppIcon.rotator_radio_active
                            : AppIcon.rotator_radio,
                        onTap: () {
                          cubit.setRotatorMethod(
                            param: PilihScript,
                            pilihScript: state.pilihScript,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Pilih Script
                RotatorTitle(
                  PilihScript,
                  showTitle: state.pilihScript.isNotEmpty,
                ),
                RotatorButton(
                  showButton: state.pilihScript.isNotEmpty,
                  textBtn: state.pilihScript['title'] ?? '',
                  height: 48,
                  onPressed: () => cubit.setRotatorMethod(
                    param: PilihScript,
                    pilihScript: state.pilihScript,
                  ),
                  textBtnStyle: AppText.Inter14w4_black,
                  margin: const EdgeInsets.only(bottom: 8),
                  tile: Text('Ganti', style: AppText.Inter12w7h12_blue_00AEFF),
                ),
                AppMessage(
                  text: state.pilihScript['status'] ?? '',
                  showMsg: state.pilihScript.isNotEmpty,
                  prefixIcon: state.pilihScript['status'] == 'Preview'
                      ? SizedBox(height: 12, child: AppIcon.rotator_eye_preview)
                      : SizedBox(height: 12, child: AppIcon.rotator_eye_close),
                  textStyle: state.pilihScript['status'] == 'Preview'
                      ? AppText.Inter12w6h14_blue_00AEFF
                      : AppText.Inter12w4_red_FF616D,
                  margin: const EdgeInsets.only(bottom: 16),
                ),

                // Custom URL
                const RotatorTitle(CustomURL),
                RotatorInput(
                  hintText: 'Masukan URL (cth: Gamis Aqila)',
                  controller: cubit.controllerRotator[0],
                  height: 48,
                  onError: cubit.contentsRotator[1] == '',
                  onChanged: (value) => cubit.contentsRotator[1] = value,
                  margin: EdgeInsets.only(
                    bottom: cubit.contentsRotator[1] == '' ? 8 : 16,
                  ),
                ),
                AppMessage(
                  text: 'Wajib Diisi!',
                  showMsg: cubit.contentsRotator[1] == '',
                  margin: const EdgeInsets.only(bottom: 16),
                ),

                // Pilih Tracking Option
                const RotatorTitle(Track),
                RotatorButton(
                  tile: AppIcon.drawer_down,
                  textBtn: cubit.contentsRotator[2] ?? 'Pilih Tracking Option',
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 48,
                  textBtnStyle: cubit.contentsRotator[2] != null
                      ? AppText.Inter14w4_black
                      : AppText.Inter14w4_grey_8F9098,
                  onPressed: () => setState(() => cubit.showDialog = Track),
                ),

                // Costumer Service
                const RotatorTitle('Customer Service'),
                RotatorButton(
                  textBtn: cubit.choicesRotator[0].isNotEmpty
                      ? cubit.choicesRotator[0].join(', ')
                      : 'Pilih Customer Service',
                  onPressed: () => BottomModal(context, sheight, cubit, state),
                  height: 48,
                  textBtnStyle: cubit.choicesRotator[0].isNotEmpty
                      ? AppText.Inter14w4_black
                      : AppText.Inter14w4_grey_8F9098,
                  margin: const EdgeInsets.only(bottom: 16),
                ),

                // Simpan
                RotatorButton(
                  onPressed: () {
                    if (canSubmit) {
                      AppExt.popScreen(context);
                    }
                  },
                  textBtn: 'Submit',
                  btnSide: submitSide,
                  height: 48,
                  margin: state.pilihScript.isNotEmpty
                      ? EdgeInsets.only(top: sheight * 0.15)
                      : EdgeInsets.only(top: sheight * 0.275),
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
                popup: cubit.showDialog == Produk,
                top: 23,
                borderRadius: BorderRadius.circular(12),
                children: [
                  ...state.listProduct.map((value) => DialogItemApp(
                        height: 48,
                        color: cubit.contentsRotator[0] == value
                            ? AppColor.grey_F5F4F6
                            : AppColor.transparent,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        onTap: () =>
                            setState(() => cubit.contentsRotator[0] = value),
                        text: value,
                      ))
                ]),

            // Pilih Tracking Option
            DialogApp(
              popup: cubit.showDialog == Track,
              top: 257,
              changePos: [cubit.contentsRotator[1] == ''],
              borderRadius: BorderRadius.circular(12),
              children: [
                ...state.listProduct.map((value) => DialogItemApp(
                      height: 48,
                      color: cubit.contentsRotator[2] == value
                          ? AppColor.grey_F5F4F6
                          : AppColor.transparent,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      onTap: () =>
                          setState(() => cubit.contentsRotator[2] = value),
                      text: value,
                    ))
              ],
            ),

            // End Stack
          ],
        ),
      ],
    );
  }

  Future<dynamic> BottomModal(
    BuildContext context,
    double sheight,
    RotatorCubit cubit,
    RotatorLoaded state,
  ) {
    List<String> cboxActiveTmp = List.from(cubit.choicesRotator[0]);

    return BottomModalApp(
      context: context,
      builder: (context) => ModalApp(
        height: sheight * 0.46,
        mainHeight: sheight * 0.286,
        headers: [
          // Cancel button
          GestureDetector(
            child: Text('Cancel', style: AppText.Inter12w6_blue_00AEFF),
            onTap: () {
              setState(
                  () => cboxActiveTmp = List.from(cubit.choicesRotator[0]));
              Navigator.pop(context);
            },
          ),

          // Title
          Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

          // Button Clear all
          GestureDetector(
            onTap: () {
              setState(() => cubit.choicesRotator[0].clear());
              setState(() => cboxActiveTmp.clear());
              Navigator.of(context).pop();
            },
            child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
          ),
        ],
        items: [
          ...state.listCS.map(
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
          onPressed: () {
            setState(() => cubit.choicesRotator[0] = List.from(cboxActiveTmp));
            Navigator.of(context).pop();
          },
          btnTextAlgn: Alignment.center,
          backgroundColor: AppColor.blue_00AEFF,
        ),
      ),
    );
  }
}
