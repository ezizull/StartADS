// ignore_for_file: unused_import, library_prefixes, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/icons.dart' as AppIcon;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/images.dart' as AppImage;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class PackageList extends StatelessWidget {
  const PackageList({
    Key? key,
    required this.dummyPackages,
  }) : super(key: key);

  final List<Map> dummyPackages;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(20),
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
            BodyPackage(index)
          ]),
        );
      }),
    );
  }

/* Header Package */
  Text HeaderPackage(
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
  Widget BodyPackage(int index) {
    return Container(
        height: 98,
        margin: const EdgeInsets.only(top: 5, bottom: 12.5),
        child: Column(
          children: dummyPackages[index]['body']?.map<Widget>((element) {
                return element != null
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            ItemBodyPackage(
                              element,
                              bodyIndex: 0,
                              baseIndex: index,
                            ),
                            ItemBodyPackage(
                              element,
                              bodyIndex: 1,
                              baseIndex: index,
                            ),
                          ],
                        ),
                      )
                    : Container();
              }).toList() ??
              [],
        ));
  }

  /* Item of BodyPackage */
  SizedBox ItemBodyPackage(element,
      {required int bodyIndex, required int baseIndex}) {
    return SizedBox(
        width: 160,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 9,
          children: [
            Text(
              element[bodyIndex] ?? '',
              style: baseIndex.isEven
                  ? AppText.NunitoSans10w6h13_black
                  : AppText.NunitoSans10w6h13_white,
            ),
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
    Color? backgroundColor,
  }) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: (() => onPressed != null ? onPressed() : null),
          style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(height),
              primary: backgroundColor,
              shape: const StadiumBorder()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(margin: const EdgeInsets.only(right: 7), child: icon),
              Text(text),
            ],
          ),
        ));
  }
}
