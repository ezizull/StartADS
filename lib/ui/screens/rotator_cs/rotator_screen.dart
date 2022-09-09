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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RotatorAppBar(context),
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          RotatorHeader(),
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
}
