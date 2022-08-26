// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/images.dart' as AppImage;

class DashboardIconsMenu extends StatelessWidget {
  const DashboardIconsMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double spacing = 38; // figma = '32'

    return Container(
      margin: EdgeInsets.only(top: spacing, bottom: spacing / 2),
      child: Wrap(
        spacing: 19,
        direction: Axis.vertical,
        children: [
          RowButtons(
            width: swidth,
            padding: EdgeInsets.symmetric(horizontal: spacing),
            children: [
              MenuButton(
                textButton: 'Script',
                AppImage: AppImage.script,
              ),
              MenuButton(
                textButton: 'Kamus CS',
                AppImage: AppImage.kamus,
              ),
              MenuButton(
                textButton: 'Contact Management',
                AppImage: AppImage.contact,
              ),
            ],
          ),
          RowButtons(
            width: swidth,
            padding: EdgeInsets.symmetric(horizontal: spacing),
            children: [
              MenuButton(
                textButton: 'Campaign',
                AppImage: AppImage.campaign,
              ),
              MenuButton(
                textButton: 'Billing',
                AppImage: AppImage.billing,
              ),
              MenuButton(
                textButton: 'Settings',
                AppImage: AppImage.settings,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /* Row of MenuButtons */
  Widget RowButtons({
    required double width,
    EdgeInsetsGeometry? padding,
    List<Widget>? children,
  }) {
    return Container(
      width: width,
      padding: padding,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: children ?? [],
      ),
    );
  }

  /* Single MenuButton */
  Widget MenuButton({
    Function? onTap,
    required String textButton,
    required String AppImage,
  }) {
    return GestureDetector(
      onTap: () {
        /* Handle onTap() */
        onTap != null ? onTap() : null;
      },
      child: SizedBox(
        width: 82,
        height: 112,
        child: Column(
          children: [
            SizedBox(
              height: 65,
              child: Image.asset(
                AppImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Text(
                textButton,
                style: AppText.Pops12w4_black,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
