// ignore_for_file: non_constant_identifier_names, prefer_final_fields,  curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors, unused_import

import 'dart:math';

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_default.dart';
import 'package:Scriptmatic/ui/widgets/app_divider.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_appbar.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_button.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_title.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RotatorAddPilihScript extends StatefulWidget {
  const RotatorAddPilihScript({required this.cubit, required this.state})
      : super();
  final RotatorCubit cubit;
  final RotatorLoaded state;

  @override
  State<RotatorAddPilihScript> createState() => _RotatorAdPilihScriptState();
}

class _RotatorAdPilihScriptState extends State<RotatorAddPilihScript> {
  @override
  void initState() {
    widget.cubit.numberRotator = List.generate(1, (index) => null);
    widget.cubit.conditionRotator = List.generate(2, (index) {
      // sortList
      if (index == 1) return true;

      // else
      return false;
    });

    for (var pilih in widget.cubit.listPilihScript) {
      if (mapEquals(pilih, widget.state.pilihScript)) {
        setState(() {
          widget.cubit.numberRotator[0] =
              widget.cubit.listPilihScript.indexOf(pilih) + 1;
        });
      }
    }

    super.initState();
  }

  int getItemIndex(int id) {
    for (var pilih in widget.cubit.listPilihScript) {
      if (pilih["id"] == id) return widget.cubit.listPilihScript.indexOf(pilih);
    }
    return 0;
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
                onTap: () => AppExt.hideKeyboard(context),
                child: Scaffold(
                  appBar: RotatorAppBar(
                    text: 'Pilih Script',
                    context: context,
                    onTap: () => widget.cubit.setRotatorMethod(
                      pilihScript: widget.state.pilihScript,
                    ),
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
    var canSubmit = cubit.conditionRotator[0];
    canSubmit = cubit.numberTrue;

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

    return Column(
      children: [
        // Header
        Container(
          margin: const EdgeInsets.only(right: 25, left: 25, top: 37),
          child: Column(
            children: [
              // Search Input
              SearchHeader(),

              // Option Button
              OptionHeader(),
            ],
          ),
        ),

        // Divider
        const AppDivider(
          color: AppColor.white_D4D6DD,
          margin: EdgeInsets.only(right: 0, left: 0),
        ),

        // List Content
        ListScript(),

        // Selected Item
        if (cubit.numberRotator[0] != null) ...[
          const AppDivider(
            color: AppColor.white_D4D6DD,
            margin: EdgeInsets.only(right: 25, left: 25, bottom: 12),
          ),

          // Selected Item
          ContHeader(getItemIndex(cubit.numberRotator[0]!)),

          const AppDivider(
            color: AppColor.white_D4D6DD,
            margin: EdgeInsets.only(right: 25, left: 25),
          ),
        ],

        // Submit Content
        RotatorButton(
          onPressed: () {
            if (cubit.numberRotator[0] != null && canSubmit) {
              widget.cubit.setRotatorMethod(
                pilihScript: widget.cubit
                    .listPilihScript[getItemIndex(cubit.numberRotator[0]!)],
              );
            }
          },
          textBtn: 'Submit',
          btnSide: submitSide,
          height: 48,
          margin: const EdgeInsets.only(
            bottom: 34,
            top: 18,
            left: 32,
            right: 32,
          ),
          backgroundColor:
              canSubmit ? AppColor.blue_00AEFF : AppColor.transparent,
          textBtnStyle: canSubmit
              ? AppText.Inter14w6_white
              : AppText.Inter14w6_grey_8F9098,
          btnTextAlgn: Alignment.center,
        ),
      ],
    );
  }

  // Search Header
  Widget SearchHeader() {
    var inputDecoration = InputDecoration(
      hintStyle: AppText.Inter14w4_grey_8F9098,
      icon: AppIcon.dashboard_search,
      hintText: 'Cari Link Rotator',
      contentPadding: const EdgeInsets.symmetric(vertical: 7),
      border: const OutlineInputBorder(
        borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 44,
      decoration: BoxDecoration(
        color: AppColor.grey_F8F9FE,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        style: AppText.Inter14w4_black,
        decoration: inputDecoration,
      ),
    );
  }

  // List of Option Button
  Widget OptionHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sort Button
          OptionBtn(
              padding: const EdgeInsets.all(7.5),
              radius: 8,
              backgroundColor: AppColor.white,
              onPressed: () {
                setState(() {
                  widget.cubit.conditionRotator[1] =
                      !widget.cubit.conditionRotator[1];

                  if (widget.cubit.conditionRotator[1]) {
                    widget.cubit.listPilihScript
                        .sort((a, b) => a["title"].compareTo(b["title"]));
                  }

                  if (!widget.cubit.conditionRotator[1]) {
                    widget.cubit.listPilihScript
                        .sort((a, b) => b["title"].compareTo(a["title"]));
                  }
                });
              },
              side: const BorderSide(width: 1, color: AppColor.grey_C5C6CC),
              children: [
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(right: 5),
                  child: widget.cubit.conditionRotator[1]
                      ? AppIcon.rotator_sort
                      : AppIcon.rotator_sort_active,
                ),
                Text(
                  'Sort',
                  style: widget.cubit.conditionRotator[1]
                      ? AppText.Inter12w4_black_1F2024
                      : AppText.Inter12w6h14_blue_00AEFF,
                ),
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(left: 7),
                  child: widget.cubit.conditionRotator[1]
                      ? AppIcon.rotator_down
                      : AppIcon.rotator_down_active,
                ),
              ]),

          // Filter Button
          OptionBtn(
            padding: const EdgeInsets.all(7.5),
            radius: 8,
            backgroundColor: AppColor.white,
            side: const BorderSide(width: 1, color: AppColor.grey_C5C6CC),
            children: [
              Container(
                height: 12,
                width: 12,
                margin: const EdgeInsets.only(right: 5),
                child: AppIcon.rotator_filter,
              ),
              Text('Filter', style: AppText.Inter12w4_black_1F2024),
            ],
          )
        ],
      ),
    );
  }

  // Option Button
  Widget OptionBtn({
    List<Widget>? children,
    BorderSide? side,
    double radius = 0,
    EdgeInsets? padding,
    Function? onPressed,
    Color? backgroundColor,
  }) {
    var styleFrom = ElevatedButton.styleFrom(
      shadowColor: AppColor.transparent,
      backgroundColor: backgroundColor ?? AppColor.transparent,
      side: side,
      padding: padding,
      minimumSize: const Size.fromRadius(7.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return children != null
        ? ElevatedButton(
            onPressed: (() => onPressed != null ? onPressed() : null),
            style: styleFrom,
            child: Row(children: children))
        : Container();
  }

  // List Script
  Expanded ListScript() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.cubit.listPilihScript.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ScriptContent(index);
        },
      ),
    );
  }

  // Each Script Content
  Widget ScriptContent(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          if (index == 0) const SizedBox(height: 16),

          // Content Header
          ContHeader(index),

          // Content Even
          if (index.isEven) ...[
            ContPesan(index, color: AppColor.grey_F8F9FE),
          ],

          // Content Odd
          if (index.isOdd) ...[
            ContPesan(index, color: AppColor.white),
          ],

          if (index == widget.cubit.listPilihScript.length - 1)
            const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget ContPesan(int index, {Color? color}) {
    return Container(
      height: 148,
      width: double.infinity,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RotatorTitle(
            'Isi Pesan',
            textStyle: AppText.Inter12w7h14_black_2F3036,
          ),
          RotatorButton(
            height: 101,
            padding: const EdgeInsets.all(16),
            foregroundColor: AppColor.grey_E5E5E5,
            textBtn: widget.cubit.listPilihScript[index]['pesan'],
            textBtnStyle: AppText.Inter14w4h20_black,
          ),
        ],
      ),
    );
  }

  Widget ContHeader(int index) {
    return Container(
      height: 47,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.cubit.listPilihScript[index]['title'],
              style: AppText.Inter12w7h14_black_2F3036,
            ),
            Text(
              "Copied ${widget.cubit.listPilihScript[index]['copied']} times",
              style: AppText.Inter12w4_grey_777C7E,
            ),

            // Status Tutup
            if (widget.cubit.listPilihScript[index]['status'] == 'Tutup') ...[
              Flexible(
                  child: Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(child: AppIcon.rotator_eye_close),
                  Text(
                    widget.cubit.listPilihScript[index]['status'],
                    style: AppText.Inter12w7h12_red_FF616D,
                  )
                ],
              ))
            ],

            // Status Preview
            if (widget.cubit.listPilihScript[index]['status'] == 'Preview') ...[
              Flexible(
                  child: Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(child: AppIcon.rotator_eye_preview),
                  Text(
                    widget.cubit.listPilihScript[index]['status'],
                    style: AppText.Inter12w7h12_blue_00AEFF,
                  )
                ],
              )),
            ],

            // End Column
          ]),

          // Button
          RotatorButton(
            textBtn: widget.cubit.numberRotator[0] ==
                    widget.cubit.listPilihScript[index]["id"]
                ? 'Terpilih'
                : 'Pilih',
            width: 70,
            padding: const EdgeInsets.all(12),
            onPressed: () => setState(() => widget.cubit.numberRotator[0] =
                widget.cubit.listPilihScript[index]["id"]),
            foregroundColor: AppColor.blue_00AEFF,
            btnSide: const BorderSide(width: 1.5, color: AppColor.blue_00AEFF),
            btnTextAlgn: Alignment.center,
            textBtnStyle: widget.cubit.numberRotator[0] ==
                    widget.cubit.listPilihScript[index]["id"]
                ? AppText.Inter12w6h14_white
                : AppText.Inter12w6h14_blue_00AEFF,
            backgroundColor: widget.cubit.numberRotator[0] ==
                    widget.cubit.listPilihScript[index]["id"]
                ? AppColor.blue_00AEFF
                : AppColor.transparent,
          ),
        ],
      ),
    );
  }
}
