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
          Container(
            width: swidth,
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: null,
                  child: SizedBox(
                    width: 82,
                    height: 112,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          child: Image.asset(
                            AppImage.script_icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          child: Text(
                            'Script',
                            style: AppText.Pops12w4_black,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: SizedBox(
                    width: 82,
                    height: 112,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          child: Image.asset(
                            AppImage.kamus_icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          child: Text(
                            'Kamus CS',
                            style: AppText.Pops12w4_black,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: SizedBox(
                    width: 82,
                    height: 112,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          child: Image.asset(
                            AppImage.contact_management_icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          child: Text(
                            'Contact Management',
                            style: AppText.Pops12w4_black,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: swidth,
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: null,
                  child: SizedBox(
                    width: 82,
                    height: 112,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          child: Image.asset(
                            AppImage.campaign_icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          child: Text(
                            'Campaign',
                            style: AppText.Pops12w4_black,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: SizedBox(
                    width: 82,
                    height: 112,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          child: Image.asset(
                            AppImage.billing_icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          child: Text(
                            'Billing',
                            style: AppText.Pops12w4_black,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: SizedBox(
                    width: 82,
                    height: 112,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          child: Image.asset(
                            AppImage.settings_icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          child: Text(
                            'Settings',
                            style: AppText.Pops12w4_black,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
