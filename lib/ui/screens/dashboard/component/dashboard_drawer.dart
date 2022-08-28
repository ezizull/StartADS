// ignore_for_file: library_prefixes, non_constant_identifier_names, must_be_immutable

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
            HeaderDrawer(),
            ListDroppedItems(dropped: widget.userDrop, children: [
              DroppedItems(text: 'Ammed'),
            ]),
            const AppDivider(
              height: 1.5,
              margin: EdgeInsets.symmetric(vertical: 20),
              color: AppColor.grey_E5E5E5,
            ),
            ListDrawerChild(
              children: [
                DrawerChild(
                  text: 'Dashboard',
                  Icon: AppIcon.dashboard_drawer,
                  tail: UpDownBtn(
                    child: widget.userDrop
                        ? AppIcon.dashboard_drawer_up
                        : AppIcon.dashboard_drawer_down,
                    onTap: (() {
                      setState(() => widget.userDrop = !widget.userDrop);
                    }),
                  ),
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
            child: Text('Lorem Ipsum', style: AppText.Pops12w6h18_black_464E5F),
          )),
          UpDownBtn(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 8),
            child: widget.userDrop
                ? AppIcon.dashboard_drawer_up
                : AppIcon.dashboard_drawer_down,
            onTap: (() {
              setState(() => widget.userDrop = !widget.userDrop);
            }),
          )
        ],
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
    return Visibility(
      visible: dropped,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 18),
        margin: margin ?? const EdgeInsets.only(left: 54),
        child: Wrap(
          direction: Axis.vertical,
          spacing: spacing,
          children: children ?? [],
        ),
      ),
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
    Function? onTap,
    EdgeInsets? padding,
    Widget? child,
  }) {
    return GestureDetector(
      onTap: (() {
        /* Handle onTap() */
        onTap != null ? onTap() : null;
      }),
      child: Container(
        color: AppColor.transparent,
        padding: padding,
        child: child,
      ),
    );
  }

  /* List of Drawer Child */
  Widget ListDrawerChild({EdgeInsets? margin, List<Widget>? children}) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 16, right: 32),
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
            UpDownBtn(
              padding: const EdgeInsets.all(9),
              child: widget.userDrop
                  ? AppIcon.dashboard_drawer_up
                  : AppIcon.dashboard_drawer_down,
              onTap: (() {
                setState(() => widget.userDrop = !widget.userDrop);
              }),
            )
          ],
        ),
      ),
    );
  }
}
