// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:startercode_project/ui/widgets/widgets.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/icons.dart' as AppIcon;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/images.dart' as AppImage;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class DashboardDrawer extends StatefulWidget {
  DashboardDrawer({
    Key? key,
    this.userDrop = false,
  }) : super(key: key);
  bool userDrop;

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  bool scriptDrop = false;
  bool contactDrop = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 284,
      child: Drawer(
        backgroundColor: AppColor.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(right: 18),
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                        backgroundImage: AssetImage(
                      AppImage.pofile_avatar,
                    )),
                  ),
                  Flexible(
                      child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Lorem Ipsum',
                        style: AppText.Pops12w6h18_black_464E5F),
                  )),
                  GestureDetector(
                    onTap: (() {
                      setState(() => widget.userDrop = !widget.userDrop);
                    }),
                    child: Container(
                      color: AppColor.transparent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 8),
                      child: AppIcon.dashboard_drawer_down,
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: widget.userDrop,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                margin: const EdgeInsets.only(left: 54),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 22,
                  children: [
                    Wrap(direction: Axis.horizontal, spacing: 10, children: [
                      Text('•', style: AppText.Pops12w6h18_black_464E5F),
                      Text('Ammet Dollor',
                          style: AppText.Pops12w6h18_black_464E5F),
                    ]),
                    Wrap(direction: Axis.horizontal, spacing: 10, children: [
                      Text('•', style: AppText.Pops12w6h18_black_464E5F),
                      Text('Ammet Dollor',
                          style: AppText.Pops12w6h18_black_464E5F),
                    ]),
                  ],
                ),
              ),
            ),
            const AppDivider(
              height: 1.5,
              margin: EdgeInsets.symmetric(vertical: 20),
              color: AppColor.grey_E5E5E5,
            ),
            Container(
              color: AppColor.grey_F5F4F6,
              margin: const EdgeInsets.only(left: 16, right: 32),
              child: Wrap(direction: Axis.vertical, spacing: 22, children: [
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
