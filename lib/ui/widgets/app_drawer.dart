// ignore_for_file: library_prefixes, non_constant_identifier_names, must_be_immutable, unused_element, use_key_in_widget_constructors

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/ui/screens/dashboard/dashboard_screen.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs/rotator_screen.dart';
import 'package:Scriptmatic/ui/widgets/app_divider.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/transitions.dart';
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class AppDrawer extends StatefulWidget {
  AppDrawer(this.activeBtn);
  String activeBtn;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with TickerProviderStateMixin<AppDrawer> {
  // delay duaration before change color
  Duration delay = const Duration(milliseconds: 800);

  // active button params
  static bool scriptDrop = false;
  static bool contactDrop = false;
  static bool userDrop = false;

  // change color delay params
  bool actvColor = false;

  // return list dropped items
  bool dropActive(List<dynamic> listDropItems) {
    for (var item in listDropItems) {
      if (item == widget.activeBtn) return true;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  void _onTap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
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
                  dropped: userDrop,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  margin: const EdgeInsets.only(left: 54),
                  children:
                      UserList.map((e) => DroppedItems(text: e)).toList()),

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
                    text: Dashboard,
                    activeIcon: AppIcon.drawer_dashboard_blue_00AEFF,
                    disableIcon: AppIcon.drawer_dashboard,
                    onTap: (() {
                      setState(() => widget.activeBtn = Dashboard);
                      AppExt.pushScreen(
                        context,
                        const DashboardScreen(),
                        AppExt.RouteTransition.fade,
                      );
                    }),
                  ),

                  // Script
                  DrawerChild(
                    text: Script,
                    activeParam: scriptDrop,
                    listDropped: ScriptList,
                    activeIcon: AppIcon.drawer_script_blue_00AEFF,
                    disableIcon: AppIcon.drawer_script,
                    onTap: (() {
                      setState(() => scriptDrop = !scriptDrop);
                    }),
                  ),
                  // Script List
                  ListDroppedItems(
                    dropped: scriptDrop,
                    margin: const EdgeInsets.only(left: 40, bottom: 30),
                    children: ScriptList.map((e) {
                      return DroppedItems(text: e);
                    }).toList(),
                  ),

                  // Kamus CS
                  DrawerChild(
                    text: Kamus,
                    disableIcon: AppIcon.drawer_kamus,
                    activeIcon: AppIcon.drawer_kamus_blue_00AEFF,
                    onTap: (() {
                      setState(() => widget.activeBtn = Kamus);
                    }),
                  ),

                  // Rotate CS
                  DrawerChild(
                    text: Rotator,
                    activeIcon: AppIcon.drawer_rotate_blue_00AEFF,
                    disableIcon: AppIcon.drawer_rotate,
                    onTap: (() {
                      setState(() => widget.activeBtn = Rotator);
                      AppExt.pushScreen(
                        context,
                        RotatorScreen(),
                        AppExt.RouteTransition.fade,
                      );
                    }),
                  ),

                  // Contact Management
                  DrawerChild(
                    text: Contact,
                    activeParam: contactDrop,
                    listDropped: ContactList,
                    activeIcon: AppIcon.drawer_contact_blue_00AEFF,
                    disableIcon: AppIcon.drawer_contact,
                    onTap: (() {
                      setState(() => contactDrop = !contactDrop);
                    }),
                  ),
                  // List Contact Management
                  ListDroppedItems(
                    dropped: contactDrop,
                    margin: const EdgeInsets.only(left: 40, bottom: 30),
                    children: ContactList.map((e) {
                      return DroppedItems(text: e);
                    }).toList(),
                  ),

                  // Campaign
                  DrawerChild(
                    text: Campaign,
                    activeIcon: AppIcon.drawer_campaign_blue_00AEFF,
                    disableIcon: AppIcon.drawer_campaign,
                    onTap: (() {
                      setState(() => widget.activeBtn = Campaign);
                    }),
                  ),

                  // Billing
                  DrawerChild(
                    text: Billing,
                    activeIcon: AppIcon.drawer_billing_blue_00AEFF,
                    disableIcon: AppIcon.drawer_billing,
                    onTap: (() {
                      setState(() => widget.activeBtn = Billing);
                    }),
                  ),

                  // Settings
                  DrawerChild(
                    text: Settings,
                    activeIcon: AppIcon.drawer_settings_blue_00AEFF,
                    disableIcon: AppIcon.drawer_settings,
                    onTap: (() {
                      setState(() => widget.activeBtn = Settings);
                    }),
                  ),
                ],
              )
            ],
          ),
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
          setState(() => userDrop = !userDrop);
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
              activeParam: userDrop,
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
    double height = 31,
    double spacing = 10,
    TextStyle? dotstyle,
    TextStyle? textstyle,
    Function? onTap,
  }) {
    // screen width
    double swidth = MediaQuery.of(context).size.width;

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
      child: Container(
        color: AppColor.transparent,
        height: height,
        width: swidth,
        alignment: Alignment.centerLeft,
        child: Wrap(direction: Axis.horizontal, spacing: spacing, children: [
          Text('•', style: dotStyle),
          Text(text, style: textStyle),
        ]),
      ),
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
        ? AppIcon.drawer_up_blue_00AEFF
        : activeParam
            ? AppIcon.drawer_up
            : !activeParam && listDropped.isNotEmpty && dropActive(listDropped)
                ? AppIcon.drawer_down_blue_00AEFF
                : AppIcon.drawer_down);

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
        if (!userDrop) {
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
