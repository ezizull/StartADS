// ignore_for_file: library_prefixes, unused_import, non_constant_identifier_names

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:Scriptmatic/config/constant/const_drawer.dart';
import 'package:Scriptmatic/ui/screens/dashboard/dashboard_screen.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs/component/rotator_header.dart';
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
  List<Map> ListRotator = [
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
      'click': '10',
      'body': 'https://app.scriptmatic.id/rotator/GamisAqila',
    },
    {
      'title': 'Gamis Aqila',
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
          const RotatorHeader(),

          // Main Rotator : Empty Link
          if (ListRotator.isEmpty) ...[
            RotatorEmpty(),
          ],

          // Main Rotator : List Link
          if (ListRotator.isNotEmpty) ...[
            RotatorLinks(),
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
        onTap: () => AppExt.popScreen(context),
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

  // Rotator Links
  Expanded RotatorLinks() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: ListRotator.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return LinkButton(index);
        },
      ),
    );
  }

  // Each Link Button
  Widget LinkButton(int index) {
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
