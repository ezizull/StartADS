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

class RotatorAddPilihScript extends StatefulWidget {
  const RotatorAddPilihScript({required this.cubit, required this.state})
      : super();
  final RotatorCubit cubit;
  final RotatorLoaded state;

  @override
  State<RotatorAddPilihScript> createState() => _RotatorAdPilihScriptState();
}

class _RotatorAdPilihScriptState extends State<RotatorAddPilihScript> {
  bool canSubmit = false;

  List<Map> ListPilih = [
    {
      'title': 'Greeting 1',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 2',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 3',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 4',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 5',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 6',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 7',
      'copied': '10',
      'status': 'Preview',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 8',
      'copied': '10',
      'status': 'Preview',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'title': 'Greeting 9',
      'copied': '10',
      'status': 'Preview',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
  ];

  int? indexActive;

  @override
  void initState() {
    super.initState();
    contPilihScript();
  }

  contPilihScript() {
    for (var pilih in ListPilih) {
      if (mapEquals(pilih, widget.state.pilihScript)) {
        setState(() => indexActive = ListPilih.indexOf(pilih));
      }
    }
  }

  void onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  submitVal() {
    if (indexActive != null && canSubmit) {
      widget.cubit.setRotatorMethod(pilihScript: ListPilih[indexActive!]);
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      var bool = indexActive != null && indexActive! < ListPilih.length;

      if (bool) canSubmit = true;
      if (!bool) canSubmit = false;
    });

    BorderSide submitSide;
    if (canSubmit) {
      submitSide = const BorderSide(width: 0);
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
          text: 'Pilih Script',
          context: context,
          onTap: () => widget.cubit.setRotatorMethod(
            pilihScript: widget.state.pilihScript,
          ),
        ),
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: Column(
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
            if (indexActive != null) ...[
              const AppDivider(
                color: AppColor.white_D4D6DD,
                margin: EdgeInsets.only(right: 25, left: 25, bottom: 12),
              ),

              // Selected Item
              ContHeader(indexActive!),

              const AppDivider(
                color: AppColor.white_D4D6DD,
                margin: EdgeInsets.only(right: 25, left: 25),
              ),
            ],

            // Submit Content
            RotatorButton(
              onPressed: submitVal,
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
        ),
      ),
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
              side: const BorderSide(width: 1, color: AppColor.grey_C5C6CC),
              children: [
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(right: 5),
                  child: AppIcon.rotator_sort,
                ),
                Text('Sort', style: AppText.Inter12w4_black_1F2024),
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(left: 7),
                  child: AppIcon.rotator_down,
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
        itemCount: ListPilih.length,
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

          if (index == ListPilih.length - 1) const SizedBox(height: 24),
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
            textBtn: ListPilih[index]['pesan'],
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
              ListPilih[index]['title'],
              style: AppText.Inter12w7h14_black_2F3036,
            ),
            Text(
              "Copied ${ListPilih[index]['copied']} times",
              style: AppText.Inter12w4_grey_777C7E,
            ),

            // Status Tutup
            if (ListPilih[index]['status'] == 'Tutup') ...[
              Flexible(
                  child: Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(child: AppIcon.rotator_eye_close),
                  Text(
                    ListPilih[index]['status'],
                    style: AppText.Inter12w7h12_red_FF616D,
                  )
                ],
              ))
            ],

            // Status Preview
            if (ListPilih[index]['status'] == 'Preview') ...[
              Flexible(
                  child: Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(child: AppIcon.rotator_eye_preview),
                  Text(
                    ListPilih[index]['status'],
                    style: AppText.Inter12w7h12_blue_00AEFF,
                  )
                ],
              )),
            ],

            // End Column
          ]),

          // Button
          RotatorButton(
            textBtn: indexActive == index ? 'Terpilih' : 'Pilih',
            width: 70,
            padding: const EdgeInsets.all(12),
            onPressed: () => setState(() => indexActive = index),
            foregroundColor: AppColor.blue_00AEFF,
            btnSide: const BorderSide(width: 1.5, color: AppColor.blue_00AEFF),
            btnTextAlgn: Alignment.center,
            textBtnStyle: indexActive == index
                ? AppText.Inter12w6h14_white
                : AppText.Inter12w6h14_blue_00AEFF,
            backgroundColor: indexActive == index
                ? AppColor.blue_00AEFF
                : AppColor.transparent,
          ),
        ],
      ),
    );
  }
}
