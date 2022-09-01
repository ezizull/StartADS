// ignore_for_file: unused_import, library_prefixes, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:Scriptmatic/data/blocs/paket/use_cubit/paket_state.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;

class PackageList extends StatelessWidget {
  PackageList(
      {Key? key, required BuildContext context, required PaketState state})
      : super(key: key);

  final List<Map> dummyPackages = [
    {
      'title': '6 Bulan',
      'discount': '594.000',
      'price': '297.000',
      'body': [
        [
          'Akses Scriptmatic 6 Bulan',
          '5 Customer Service',
          'Ratusan Template Script Follow Up Customer',
          ''
        ],
        [
          'Kamus CS (Kamus Penolakan)',
          'Free Update',
          'Chat Support',
          'Panduan Lengkap'
        ],
      ]
    },
    {
      'title': '1 Tahun',
      'discount': '794.000',
      'price': '297.000',
      'body': [
        [
          'Akses Scriptmatic 6 Bulan',
          '5 Customer Service',
          'Ratusan Template Script Follow Up Customer',
          ''
        ],
        [
          'Kamus CS (Kamus Penolakan)',
          'Free Update',
          'Chat Support',
          'Panduan Lengkap'
        ],
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: dummyPackages.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return PackageCanvas(
          color: index.isEven ? AppColor.white : AppColor.blue_00AEFF,
          margin: const EdgeInsets.only(bottom: 15),
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2.75),
              blurRadius: 20.55,
              color: AppColor.black.withOpacity(0.1),
            )
          ],
          height: 257,
          padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
          child: PackageContent(children: [
            /* Title Package */
            HeaderPackage(
              index,
              sub: 'title',
              textStyle: index.isEven
                  ? AppText.NunitoSans25w8h34_black
                  : AppText.NunitoSans25w8h34_white,
            ),

            /* Discount Package */
            HeaderPackage(
              index,
              sub: 'discount',
              textStyle: index.isEven
                  ? AppText.NunitoSans12w8h16_lineThrough_black_464E5F
                  : AppText.NunitoSans12w8h16_lineThrough_white,
            ),

            /* Price Package */
            HeaderPackage(
              index,
              sub: 'price',
              textStyle: index.isEven
                  ? AppText.NunitoSans21w8h28_black_464E5F
                  : AppText.NunitoSans21w8h28_white,
            ),

            /* Body Package */
            BodyPackage(index, width: swidth * 0.4),

            /* Submit Button */
            Center(
                child: ButtonContent(
              icon: index.isEven
                  ? AppIcon.haveit_now_white
                  : AppIcon.haveit_now_blue_00AEFF,
              text: 'Miliki Sekarang',
              height: 26,
              width: 169,
              textStyle: index.isEven
                  ? AppText.NunitoSans9w7h12_white
                  : AppText.NunitoSans9w7h12_blue_00AEFF,
              backgroundColor:
                  index.isEven ? AppColor.blue_00AEFF : AppColor.white,
              foregroundColor:
                  index.isEven ? AppColor.white : AppColor.blue_00AEFF,
            ))
          ]),
        );
      }),
    );
  }

/* Header Package */
  Widget HeaderPackage(
    int index, {
    required TextStyle textStyle,
    required String sub,
  }) {
    return Text(
      dummyPackages[index][sub] ?? '',
      style: textStyle,
    );
  }

  /* Body Package */
  Widget BodyPackage(int index, {double? width}) {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 12.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dummyPackages[index]['body']?.map<Widget>((element) {
                return element != null
                    ? Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 9,
                        children: [
                          ItemBodyPackage(
                            element,
                            width: width,
                            bodyIndex: 0,
                            baseIndex: index,
                          ),
                          ItemBodyPackage(
                            element,
                            width: width,
                            bodyIndex: 1,
                            baseIndex: index,
                          ),
                          ItemBodyPackage(
                            element,
                            width: width,
                            bodyIndex: 2,
                            baseIndex: index,
                          ),
                          ItemBodyPackage(
                            element,
                            width: width,
                            bodyIndex: 3,
                            baseIndex: index,
                          ),
                        ],
                      )
                    : Container();
              }).toList() ??
              [],
        ));
  }

  /* Item of BodyPackage */
  SizedBox ItemBodyPackage(
    element, {
    required int bodyIndex,
    required int baseIndex,
    double? width,
  }) {
    return SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Icon of Item */
            (element.length - 1) >= bodyIndex && element[bodyIndex] != ''
                ? Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.only(right: 9),
                    child: baseIndex.isEven
                        ? AppIcon.haveit_now_blue_00AEFF
                        : AppIcon.haveit_now_white,
                  )
                : Container(),

            /* Text of Item */
            (element.length - 1) >= bodyIndex && element[bodyIndex] != ''
                ? Flexible(
                    child: Text(
                      element[bodyIndex],
                      style: baseIndex.isEven
                          ? AppText.NunitoSans10w6h13_black
                          : AppText.NunitoSans10w6h13_white,
                    ),
                  )
                : Flexible(child: Container()),
          ],
        ));
  }

  /* 1 : Package Canvas to be Decorated */
  Widget PackageCanvas({
    required double height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    Widget? child, // when only have PackageContent
    List<Widget>? children, // when using PackageDecoration
    List<BoxShadow>? boxShadow,
    BorderRadiusGeometry? borderRadius,
  }) {
    return Container(
      height: height,
      width: double.infinity, // change this, if width become error
      margin: margin,
      padding: padding,
      clipBehavior: Clip.hardEdge, // apply rounded to child
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
        boxShadow: boxShadow,
      ),
      child: child ?? Stack(children: children ?? []),
    );
  }

  /* 2 : Single Package Decoration */
  Positioned PackageDecor({
    double? left,
    double? bottom,
    double? right,
    double? top,
    Widget? child,
  }) {
    return Positioned(
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: child ?? Container(),
    );
  }

  /* 3 : Package Content build your own Content*/
  Widget PackageContent({
    EdgeInsets? margin,
    List<Widget>? children,
  }) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children ?? [],
      ),
    );
  }

  /* 4 : Button of Content */
  Widget ButtonContent({
    double? width,
    Widget? icon,
    Function? onPressed,
    String text = '',
    double height = 32,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: (() => onPressed != null ? onPressed() : null),
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height),
            primary: backgroundColor,
            onPrimary: foregroundColor,
            shape: const StadiumBorder()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(margin: const EdgeInsets.only(right: 7), child: icon),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}
