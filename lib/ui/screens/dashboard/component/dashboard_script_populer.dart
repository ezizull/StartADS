import 'package:flutter/material.dart';
import 'package:startercode_project/utils/icons.dart' as AppIcon;
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class DashboardScriptPopular extends StatelessWidget {
  DashboardScriptPopular({
    Key? key,
  }) : super(key: key);

  final List<Map> dummyScripts = [
    {
      'title': 'Fashion Wanita',
      'greet': 'Greeting',
      'body':
          'Hallo Sis, stock {nama produk} masih ready? Info cara pemesanan donk'
    },
    {
      'title': 'Mainan Anak',
      'greet': 'Greeting',
      'body':
          'Hallo, Saya tertarik dengan { nama produk}, apakah masih tersedia?'
    },
    {
      'title': 'Sports',
      'greet': 'Greeting',
      'body':
          'Hallo, Saya tertarik dengan {nama produk}, apakah stocknya masih tersedia?'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Script Populer',
                style: AppText.Lato14w7_black,
              ),
              GestureDetector(
                onTap: null,
                child: Text(
                  'See more',
                  style: AppText.Inter12w6_primary,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 125,
          margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: dummyScripts.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              width: 224,
              height: 125,
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 15,
                right: index == dummyScripts.length - 1 ? 20 : 0,
              ),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: (() => debugPrint('clicked script populer')),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColor.scriptPopular[index],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      /* title */
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dummyScripts[index]['title'],
                              style: AppText.Inter13w7_black2,
                            ),
                            GestureDetector(
                              onTap: (() =>
                                  debugPrint('clicked script populer dots')),
                              child: Container(
                                width: 16,
                                color: AppColor.transparent,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1.5,
                                  vertical: 6.5,
                                ),
                                child: AppIcon
                                    .dashboard_script_horizontal_dots_icon,
                              ),
                            )
                          ],
                        ),
                      ),
                      /* greeting */
                      Container(
                        height: 18,
                        width: 192,
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Flexible(
                                child: Text(
                              dummyScripts[index]['greet'],
                              style: AppText.Nunito13w6_black,
                            )),
                          ],
                        ),
                      ),
                      /* body */
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 192,
                        height: 30,
                        child: Column(
                          children: [
                            Flexible(
                                child: Text(
                              dummyScripts[index]['body'],
                              style: AppText.Pops10w4_white,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
