import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/images.dart' as AppImage;

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({
    Key? key,
    this.onTapDrawer,
  }) : super(key: key);

  final Function? onTapDrawer;
  final double mirror = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        height: 281,
        decoration: BoxDecoration(gradient: AppColor.dashboardBanner),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: -267.5 + mirror,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(math.pi),
                child: SizedBox(
                  width: 367,
                  height: 301,
                  child: Image.asset(AppImage.dashboard_bg_girl),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: -20 - mirror,
              child: Container(
                width: 367,
                height: 301,
                child: Image.asset(AppImage.dashboard_bg_girl),
              ),
            ),
            Positioned(
              right: -4,
              bottom: 7,
              child: SizedBox(
                width: 218,
                height: 201,
                child: Image.asset(AppImage.dashboard_girl),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onTapDrawer != null ? onTapDrawer!() : null;
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 16),
                            child: AppIcon.dashboard_drawer_btn,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 38,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: AppText.Inter14w4_black,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: AppText.Inter14w4_grey_8F9098,
                                icon: AppIcon.dashboard_search,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("Paket Lifetime", style: AppText.Pops28w6_white),
                  Wrap(
                    spacing: 13,
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text("Expired Date:", style: AppText.Pops15w6_white),
                      Container(
                          height: 18,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 18,
                              color: AppColor.white,
                            )
                          ]),
                          child: AppIcon.dashboard_infinite)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
