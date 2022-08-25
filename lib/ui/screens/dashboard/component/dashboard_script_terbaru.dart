import 'package:flutter/material.dart';
import 'package:startercode_project/utils/icons.dart' as AppIcon;
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class DashboardScriptTerbaru extends StatelessWidget {
  DashboardScriptTerbaru({
    Key? key,
  }) : super(key: key);

  final List<Map> dummyScripts = [
    {
      'image': 'assets/images/dashboard/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image': 'assets/images/dashboard/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image': 'assets/images/dashboard/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
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
                'Script Terbaru',
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
          height: 170,
          margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              width: 224,
              height: 125,
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 15,
                right: index == 2 ? 20 : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    /* title */
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 16,
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 3,
                              ),
                              child:
                                  AppIcon.dashboard_script_vertical_dots_icon,
                            ),
                          )
                        ],
                      ),
                    ),
                    /* tagsing */
                    Container(
                      height: 16,
                      width: 192,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 14,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.ligthOrangeBg,
                                borderRadius: BorderRadius.circular(36),
                              ),
                              child: Text(dummyScripts[index]['tags'],
                                  style: AppText.NunitoSans7w7_orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* title */
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 192,
                      height: 30,
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Flexible(
                              child: Text(
                            dummyScripts[index]['title'],
                            style: AppText.Inter10w6_black2,
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
      ],
    );
  }
}
