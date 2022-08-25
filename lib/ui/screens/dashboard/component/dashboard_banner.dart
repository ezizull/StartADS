import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/icons.dart' as AppIcon;

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        height: 261,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          stops: const [
            0.1,
            0.4,
            0.9,
          ],
          colors: [
            AppColor.whiteBlueBg.withOpacity(0.5),
            AppColor.childBlueBg,
            AppColor.darkBlueBg,
          ],
        )),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: 367,
                child: Image.asset(
                  "assets/images/dashboard/dashboard_bg_girl.png",
                ),
              ),
            ),
            Positioned(
              right: -4,
              bottom: 2,
              child: SizedBox(
                  width: 218,
                  height: 201,
                  child: Image.asset(
                      "assets/images/dashboard/dashboard_girl.png")),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          margin: const EdgeInsets.only(right: 16),
                          child: AppIcon.dashboard_avatar_icon,
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
                              style: AppText.InterTextField,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: AppText.InterTextFieldHint,
                                icon: AppIcon.dashboard_search_icon,
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
                  Text("Paket Lifetime", style: AppText.PopsTitle),
                  Wrap(
                    spacing: 13,
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text("Expired Date:", style: AppText.PopsHeading2),
                      Container(
                          height: 18,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: AppColor.white,
                            )
                          ]),
                          child: AppIcon.dashboard_infinite_icon)
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
