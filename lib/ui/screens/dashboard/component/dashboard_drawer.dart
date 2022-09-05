// ignore_for_file: library_prefixes, non_constant_identifier_names, must_be_immutable, unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:Scriptmatic/ui/screens/article/article_screen.dart';
import 'package:Scriptmatic/ui/widgets/widgets.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;

class DashboardDrawer extends StatefulWidget {
  DashboardDrawer({
    Key? key,
    this.scriptDrop = false,
    this.contactDrop = false,
    this.userDrop = false,
    this.activeBtn = '',
  }) : super(key: key);

  bool scriptDrop;
  bool contactDrop;
  bool userDrop;
  String activeBtn;

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer>
    with TickerProviderStateMixin<DashboardDrawer> {
  // delay duaration before change color
  Duration delay = const Duration(milliseconds: 800);

  // change color delay params
  bool actvColor = false;

  // return list dropped items
  bool dropActive(List<dynamic> listDropItems) {
    for (var item in listDropItems) {
      if (item == widget.activeBtn) {
        return true;
      }
    }
    return false;
  }

  // list of dropped items
  List<String> ScriptList = ['Script Chat', 'Script Campaign'];

  // list of dropped items
  List<String> ContactList = ['Kontak Pelanggan', 'Grup Pelanggan'];

  // List of dropped user
  List<String> UserList = ['Ammed'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 284,
      child: Drawer(
        backgroundColor: AppColor.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            // header and expanded
            HeaderDrawer(
              margin: const EdgeInsets.only(right: 16, left: 16, top: 25),
            ),
            ListDroppedItems(
                dropped: widget.userDrop,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                margin: const EdgeInsets.only(left: 54),
                children: [
                  DroppedItems(text: UserList[0]),
                ]),

            // divider line
            const AppDivider(
              height: 1.5,
              margin: EdgeInsets.symmetric(vertical: 20),
              color: AppColor.grey_E5E5E5,
            ),

            // menus in drawer
            ListDrawerChild(
              children: [
                // Dashboard
                DrawerChild(
                  text: 'Dashboard',
                  activeIcon: AppIcon.dashboard_drawer_blue_00AEFF,
                  disableIcon: AppIcon.dashboard_drawer,
                  onTap: (() {
                    setState(() => widget.activeBtn = 'Dashboard');
                  }),
                ),

                // Script
                DrawerChild(
                  text: 'Script',
                  activeParam: widget.scriptDrop,
                  listDropped: ScriptList,
                  activeIcon: AppIcon.dashboard_drawer_script_blue_00AEFF,
                  disableIcon: AppIcon.dashboard_drawer_script,
                  onTap: (() {
                    setState(() => widget.scriptDrop = !widget.scriptDrop);
                  }),
                ),
                // Script List
                ListDroppedItems(
                  dropped: widget.scriptDrop,
                  margin: const EdgeInsets.only(left: 40, bottom: 30),
                  children: [
                    DroppedItems(text: ScriptList[0]),
                    DroppedItems(text: ScriptList[1]),
                  ],
                ),

                // Kamus CS
                DrawerChild(
                  text: 'Kamus CS',
                  disableIcon: AppIcon.dashboard_drawer_kamus,
                  activeIcon: AppIcon.dashboard_drawer_kamus_blue_00AEFF,
                  onTap: (() {
                    setState(() => widget.activeBtn = 'Kamus CS');
                  }),
                ),

                // Contact Management
                DrawerChild(
                  text: 'Contact Management',
                  activeParam: widget.contactDrop,
                  listDropped: ContactList,
                  activeIcon: AppIcon.dashboard_drawer_contact_blue_00AEFF,
                  disableIcon: AppIcon.dashboard_drawer_contact,
                  onTap: (() {
                    setState(() => widget.contactDrop = !widget.contactDrop);
                  }),
                ),
                // List Contact Management
                ListDroppedItems(
                  dropped: widget.contactDrop,
                  margin: const EdgeInsets.only(left: 40, bottom: 30),
                  children: [
                    DroppedItems(text: ContactList[0]),
                    DroppedItems(text: ContactList[1]),
                  ],
                ),

                // Campaign
                DrawerChild(
                  text: 'Campaign',
                  activeIcon: AppIcon.dashboard_drawer_campaign_blue_00AEFF,
                  disableIcon: AppIcon.dashboard_drawer_campaign,
                  onTap: (() {
                    setState(() => widget.activeBtn = 'Campaign');
                  }),
                ),

                // Billing
                DrawerChild(
                  text: 'Billing',
                  activeIcon: AppIcon.dashboard_drawer_billing_blue_00AEFF,
                  disableIcon: AppIcon.dashboard_drawer_billing,
                  onTap: (() {
                    setState(() => widget.activeBtn = 'Billing');
                  }),
                ),

                // Settings
                DrawerChild(
                  text: 'Settings',
                  activeIcon: AppIcon.dashboard_drawer_settings_blue_00AEFF,
                  disableIcon: AppIcon.dashboard_drawer_settings,
                  onTap: (() {
                    setState(() => widget.activeBtn = 'Settings');
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Top of Drawer
  Widget HeaderDrawer({EdgeInsets? margin}) {
    var textStyle = (widget.activeBtn == 'Lorem Ipsum' && UserList.isEmpty) ||
            UserList.isNotEmpty && dropActive(UserList)
        ? AppText.Pops12w6h18_blue_00AEFF
        : AppText.Pops12w6h18_black_464E5F;

    return Container(
      color: AppColor.transparent,
      margin: margin,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: (() {
          setState(() => widget.userDrop = !widget.userDrop);

          /* 
            // delay when closing expand
            if (!widget.userDrop) {
              Future.delayed(delay, () => setState(() => actvColor = false));
            }

            // direct when open expand
            else {
              setState(() => actvColor = true);
            } 
          */
        }),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // photo profile
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

            // text
            Flexible(
                child: Container(
              color: AppColor.transparent,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Lorem Ipsum', style: textStyle),
            )),

            // tile
            UpDownBtn(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
              activeParam: widget.userDrop,
              listDropped: UserList,
            )
          ],
        ),
      ),
    );
  }

  // List Dropped Items
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
        return Container(
          padding: padding,
          margin: margin,
          width: double.infinity,
          child: Wrap(
            direction: Axis.vertical,
            spacing: spacing,
            children: children ?? [],
          ),
        );
      }),
    );
  }

  // Dropped Items
  Widget DroppedItems({
    String text = '',
    double spacing = 10,
    TextStyle? dotstyle,
    TextStyle? textstyle,
    Function? onTap,
  }) {
    // dotStyle
    var dotStyle = dotstyle ??
        (widget.activeBtn == text
            ? AppText.Pops13w4_blue_00AEFF
            : AppText.Pops13w4_grey_9F9FB9);

    // textStyle
    var textStyle = textstyle ??
        (widget.activeBtn == text
            ? AppText.Pops13w4_blue_00AEFF
            : AppText.Pops13w4_grey_9F9FB9);

    return GestureDetector(
      onTap: (() {
        // set active button
        setState(() => widget.activeBtn = text);

        // Handle onTap()
        onTap != null ? onTap() : null;
      }),
      child: Wrap(direction: Axis.horizontal, spacing: spacing, children: [
        Text('•', style: dotStyle),
        Text(text, style: textStyle),
      ]),
    );
  }

  // Up Down Icon
  Widget UpDownBtn({
    bool activeParam = false,
    List<dynamic> listDropped = const [],
    EdgeInsets? padding,
    Widget? child,
  }) {
    // condition
    var cond = (activeParam && listDropped.isNotEmpty && dropActive(listDropped)
        ? AppIcon.dashboard_drawer_up_blue_00AEFF
        : activeParam
            ? AppIcon.dashboard_drawer_up
            : !activeParam && listDropped.isNotEmpty && dropActive(listDropped)
                ? AppIcon.dashboard_drawer_down_blue_00AEFF
                : AppIcon.dashboard_drawer_down);

    return Container(
      color: AppColor.transparent,
      padding: padding,
      child: child ?? cond,
    );
  }

  // List of Drawer Child
  Widget ListDrawerChild({
    EdgeInsets? margin,
    List<Widget>? children,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 20, right: 32),
      child: Column(children: children ?? []),
    );
  }

  // Drawer Child
  Widget DrawerChild({
    List<dynamic> listDropped = const [],
    bool activeParam = false,
    double height = 31,
    Widget? Icon,
    Widget? activeIcon,
    Widget? disableIcon,
    Widget? tail,
    TextStyle? textstyle,
    String text = '',
    double marginBottom = 22,
    Function? onTap,
    double marginRight = 9,
    EdgeInsets? textPadding,
  }) {
    // text style
    var textStyle = textstyle ??
        ((widget.activeBtn == text && listDropped.isEmpty) ||
                listDropped.isNotEmpty && dropActive(listDropped)
            ? AppText.Pops13w4_blue_00AEFF
            : AppText.Pops13w4_grey_9F9FB9);

    // tail widget
    var TailWidget = tail ??
        (listDropped.isNotEmpty
            ? UpDownBtn(
                padding: const EdgeInsets.all(9),
                activeParam: activeParam,
                listDropped: listDropped,
              )
            : Container());

    // Icon Widget
    var IconWidget = Icon ??
        ((widget.activeBtn == text && listDropped.isEmpty) ||
                listDropped.isNotEmpty && dropActive(listDropped)
            ? (activeIcon ?? Container())
            : (disableIcon ?? Container()));

    return GestureDetector(
      onTap: (() {
        // Handle onTap()
        onTap != null ? onTap() : null;

        // delay when closing expand
        if (!widget.userDrop) {
          Future.delayed(delay, () => setState(() => actvColor = false));
        }

        // direct when open expand
        else {
          setState(() => actvColor = true);
        }
      }),
      child: Container(
        height: height,
        color: AppColor.transparent,
        margin: EdgeInsets.only(bottom: marginBottom),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: marginRight),
              child: IconWidget,
            ),
            Expanded(
              child: Container(
                padding: textPadding ?? const EdgeInsets.symmetric(vertical: 5),
                child: Text(text, style: textStyle),
              ),
            ),
            TailWidget,
          ],
        ),
      ),
    );
  }
}
