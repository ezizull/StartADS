// ignore_for_file: library_prefixes, unused_import, non_constant_identifier_names, must_be_immutable

// Flutter imports:
import 'package:Scriptmatic/ui/screens/rotator_cs_add/rotator_add_screen.dart';
import 'package:Scriptmatic/ui/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/ui/screens/dashboard/dashboard_screen.dart';
import 'package:Scriptmatic/ui/widgets/app_drawer.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class RotatorScreen extends StatefulWidget {
  const RotatorScreen({Key? key}) : super(key: key);

  @override
  State<RotatorScreen> createState() => _RotatorScreenState();
}

class _RotatorScreenState extends State<RotatorScreen> {
  bool sortList = true;

  List<Map> ListRotator = [
    {
      'id': 1,
      'title': 'Gamis Aqila 1',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 2,
      'title': 'Gamis Aqila 2',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 3,
      'title': 'Gamis Aqila 3',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 4,
      'title': 'Gamis Aqila 4',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 5,
      'title': 'Gamis Aqila 5',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 6,
      'title': 'Gamis Aqila 6',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 7,
      'title': 'Gamis Aqila 7',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 8,
      'title': 'Gamis Aqila 8',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'id': 9,
      'title': 'Gamis Aqila 9',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RotatorAppBar(context),
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Rotator
          RotatorHeader(context),

          // Main Rotator : Empty Link
          if (ListRotator.isEmpty) ...[
            RotatorEmpty(),
          ],

          // Main Rotator : List Link
          if (ListRotator.isNotEmpty) ...[
            ListLink(),
          ],
        ],
      ),
    );
  }

  // Rotator AppBar
  AppBar RotatorAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      leading: GestureDetector(
        onTap: () => AppExt.pushAndRemoveScreen(
          context,
          pageRef: const DashboardScreen(),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          color: AppColor.transparent,
          child: AppIcon.package_left_button,
        ),
      ),
      title: Text(Rotator, style: AppText.Inter16w7_black_1F2024),
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0, // 1
    );
  }

  Widget RotatorHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25, left: 25, top: 37),
      child: Column(
        children: [
          // Search Input
          SearchHeader(),

          // Option Button
          OptionHeader(),

          // Tambah Link
          AddRotator(
            onPressed: (() {
              AppExt.pushScreen(
                context,
                const RotatorAddScreen(),
                AppExt.RouteTransition.fade,
              );
            }),
          ),

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
              onPressed: () {
                setState(() {
                  sortList = !sortList;

                  if (sortList) {
                    ListRotator.sort(
                      (a, b) => a["title"].compareTo(b["title"]),
                    );
                  }

                  if (!sortList) {
                    ListRotator.sort(
                      (a, b) => b["title"].compareTo(a["title"]),
                    );
                  }
                });
              },
              side: const BorderSide(width: 1, color: AppColor.grey_C5C6CC),
              children: [
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(right: 5),
                  child: sortList
                      ? AppIcon.rotator_sort
                      : AppIcon.rotator_sort_active,
                ),
                Text(
                  'Sort',
                  style: sortList
                      ? AppText.Inter12w4_black_1F2024
                      : AppText.Inter12w6h14_blue_00AEFF,
                ),
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(left: 7),
                  child: sortList
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

  // Add Rotator
  Widget AddRotator({Function? onPressed}) {
    var boxDecoration = BoxDecoration(
      color: AppColor.blue_00AEFF,
      borderRadius: BorderRadius.circular(5),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: OptionBtn(
        onPressed: onPressed,
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

  // Rotator List Empty
  Expanded RotatorEmpty() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Container(
              width: 152,
              margin: const EdgeInsets.only(bottom: 34.8),
              child: Image.asset(AppImage.rotator_kosong),
            ),

            // text
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 7,
                direction: Axis.vertical,
                children: [
                  Text(
                    'Link Rotator Kosong',
                    style: AppText.Inter14w7h17_black,
                  ),
                  SizedBox(
                    width: 215,
                    child: Text(
                      'Silahkan tambahkan link rotator terlebih dahulu',
                      style: AppText.Inter13w4h15_black_464E5F,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                backgroundColor: AppColor.blue_00AEFF,
                shadowColor: AppColor.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.15),
                ),
              ),
              child: const Text('Tambah Link'),
            )
          ],
        ),
      ),
    );
  }

  // List Link
  Expanded ListLink() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: ListRotator.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return LinkRotator(index);
        },
      ),
    );
  }

  // Each Link Rotator
  Widget LinkRotator(int index) {
    const boxDecoration = BoxDecoration(
      border: Border(bottom: BorderSide(width: 1, color: AppColor.grey_F3F6F9)),
    );

    var title = Text(
      ListRotator[index]['title'],
      style: AppText.Inter13w7h15_black_2F3036,
    );

    var subtitle = Wrap(direction: Axis.vertical, spacing: 2, children: [
      // body subtitle
      Text(ListRotator[index]['body'], style: AppText.Inter12w5h12_grey_9F9FB9),

      // clicked subtitle
      Text(
        'Clicked: ${ListRotator[index]['click']}',
        style: AppText.Inter12w7h12_blue_3699FF,
      )
    ]);

    var trailing = Container(
      padding: const EdgeInsets.all(5.8),
      color: AppColor.grey_F3F6F9,
      child: AppIcon.rotator_edit,
    );

    return Container(
      decoration: boxDecoration,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
        title: title,
        selectedTileColor: AppColor.grey_777C7E,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
