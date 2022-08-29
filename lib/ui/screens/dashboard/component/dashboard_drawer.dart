// ignore_for_file: library_prefixes, non_constant_identifier_names, must_be_immutable, unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:startercode_project/ui/screens/article/article_screen.dart';
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

class _DashboardDrawerState extends State<DashboardDrawer>
    with TickerProviderStateMixin {
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
            HeaderDrawer(),
            ListDroppedItems(
                dropped: widget.userDrop,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                margin: const EdgeInsets.only(left: 54),
                children: [
                  DroppedItems(text: 'Ammed'),
                ]),
            const AppDivider(
              height: 1.5,
              margin: EdgeInsets.symmetric(vertical: 20),
              color: AppColor.grey_E5E5E5,
            ),
            ListDrawerChild(
              children: [
                /* Dashboard */
                DrawerChild(
                  text: 'Dashboard',
                  Icon: AppIcon.dashboard_drawer,
                ),

                /* Script */
                DrawerChild(
                  text: 'Script',
                  Icon: AppIcon.dashboard_drawer_script,
                  onTap: (() => setState(() {
                        scriptDrop = !scriptDrop;
                      })),
                  tail: UpDownBtn(
                    child: scriptDrop
                        ? AppIcon.dashboard_drawer_up
                        : AppIcon.dashboard_drawer_down,
                    padding: const EdgeInsets.all(9),
                  ),
                ),
                /* Script List */
                ListDroppedItems(
                  dropped: scriptDrop,
                  margin: const EdgeInsets.only(left: 40, bottom: 30),
                  children: [
                    DroppedItems(
                      text: 'Script Chat',
                      textstyle: AppText.Pops13w4_grey_9F9FB9,
                    ),
                    DroppedItems(
                      text: 'Script Campaign',
                      textstyle: AppText.Pops13w4_grey_9F9FB9,
                    ),
                  ],
                ),

                /* Kamus CS */
                DrawerChild(
                  text: 'Kamus CS',
                  Icon: AppIcon.dashboard_drawer_kamus,
                ),

                /* Contact Management */
                DrawerChild(
                  text: 'Contact Management',
                  Icon: AppIcon.dashboard_drawer_contact,
                  onTap: (() => setState(() => contactDrop = !contactDrop)),
                  tail: UpDownBtn(
                    child: contactDrop
                        ? AppIcon.dashboard_drawer_up
                        : AppIcon.dashboard_drawer_down,
                    padding: const EdgeInsets.all(9),
                  ),
                ),
                /* List Contact Management */
                ListDroppedItems(
                  dropped: contactDrop,
                  margin: const EdgeInsets.only(left: 40, bottom: 30),
                  children: [
                    DroppedItems(
                      text: 'Kontak Pelanggan',
                      textstyle: AppText.Pops13w4_grey_9F9FB9,
                    ),
                    DroppedItems(
                      text: 'Grup Pelanggan',
                      textstyle: AppText.Pops13w4_grey_9F9FB9,
                    ),
                  ],
                ),

                /* Campaign */
                DrawerChild(
                  text: 'Campaign',
                  Icon: AppIcon.dashboard_drawer_campaign,
                ),

                /* Billing */
                DrawerChild(
                  text: 'Billing',
                  Icon: AppIcon.dashboard_drawer_billing,
                ),

                /* Settings */
                DrawerChild(
                  text: 'Settings',
                  Icon: AppIcon.dashboard_drawer_settings,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /* Top of Drawer */
  Widget HeaderDrawer() {
    return Container(
      color: AppColor.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(right: 18),
                alignment: Alignment.center,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(AppImage.pofile_avatar),
                ),
              ),
            ),
            Flexible(
                child: GestureDetector(
              onTap: (() => setState(() => widget.userDrop = !widget.userDrop)),
              child: Container(
                color: AppColor.transparent,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('Lorem Ipsum',
                    style: AppText.Pops12w6h18_black_464E5F),
              ),
            )),
            UpDownBtn(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
              child: widget.userDrop
                  ? AppIcon.dashboard_drawer_up
                  : AppIcon.dashboard_drawer_down,
            )
          ],
        ),
      ),
    );
  }

  /* List Dropped Items */
  Widget ListDroppedItems({
    required bool dropped,
    double spacing = 22,
    EdgeInsets? margin,
    EdgeInsets? padding,
    List<Widget>? children,
  }) {
    return ExpandMotion(
      expand: dropped,
      child: Builder(builder: (context) {
        return Visibility(
          visible: true, // change for use blinked mode
          child: Container(
            padding: padding,
            margin: margin,
            width: double.infinity,
            child: Wrap(
              direction: Axis.vertical,
              spacing: spacing,
              children: children ?? [],
            ),
          ),
        );
      }),
    );
  }

  /* Dropped Items */
  Widget DroppedItems({
    String text = '',
    double spacing = 10,
    TextStyle? dotstyle,
    TextStyle? textstyle,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: (() {
        /* Handle onTap() */
        onTap != null ? onTap() : null;
      }),
      child: Wrap(direction: Axis.horizontal, spacing: spacing, children: [
        Text('•', style: dotstyle ?? AppText.Pops12w6h18_black_464E5F),
        Text(text, style: textstyle ?? AppText.Pops12w6h18_black_464E5F),
      ]),
    );
  }

  /* Up Down Icon */
  Widget UpDownBtn({
    EdgeInsets? padding,
    Widget? child,
  }) {
    return Container(
      color: AppColor.transparent,
      padding: padding,
      child: child,
    );
  }

  /* List of Drawer Child */
  Widget ListDrawerChild({
    EdgeInsets? margin,
    List<Widget>? children,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 20, right: 32),
      child: Column(children: children ?? []),
    );
  }

  /* Drawer Child */
  Widget DrawerChild({
    double height = 31,
    TextStyle? textstyle,
    double marginBottom = 22,
    EdgeInsets? textPadding,
    double marginRight = 9,
    Widget? tail,
    Function? onTap,
    String text = '',
    Widget? Icon,
  }) {
    return GestureDetector(
      onTap: (() {
        /* Handle onTap() */
        onTap != null ? onTap() : null;
      }),
      child: Container(
        height: height,
        color: AppColor.transparent,
        margin: EdgeInsets.only(bottom: marginBottom),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: marginRight),
              child: Icon,
            ),
            Expanded(
              child: Container(
                padding: textPadding ?? const EdgeInsets.symmetric(vertical: 5),
                child: Text(text,
                    style: textstyle ?? AppText.Pops13w4_grey_9F9FB9),
              ),
            ),
            tail ?? Container()
          ],
        ),
      ),
    );
  }
}
