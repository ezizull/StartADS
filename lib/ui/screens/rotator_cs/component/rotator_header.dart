// ignore_for_file: non_constant_identifier_names

// Flutter imports:
import 'package:Scriptmatic/ui/widgets/app_divider.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class RotatorHeader extends StatelessWidget {
  const RotatorHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25, left: 25, top: 37),
      child: Column(
        children: [
          // Search Input
          SearchHeader(),

          // Option Button
          OptionHeader(),

          // Tambah Link
          AddRotator(),

          // Divider
          const AppDivider(
            color: AppColor.white_D4D6DD,
            margin: EdgeInsets.only(right: 0, left: 0, bottom: 16),
          ),

          // Daftar Link Rotator
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Daftar Link Rotator',
                style: AppText.Inter12w7h14_black_2F3036),
          )
        ],
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
              ])
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
      minimumSize: const Size.fromRadius(7.6),
      padding: padding,
      side: side,
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

  // Add Rotator
  Widget AddRotator() {
    var boxDecoration = BoxDecoration(
      color: AppColor.blue_00AEFF,
      borderRadius: BorderRadius.circular(5),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: OptionBtn(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(7.6),
            child: AppIcon.rotator_add,
            decoration: boxDecoration,
          ),
          Text('Tambah Link Rotator', style: AppText.Inter14w4_black)
        ],
      ),
    );
  }
}
