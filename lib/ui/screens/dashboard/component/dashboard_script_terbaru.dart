// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:startercode_project/ui/widgets/widgets.dart';
import 'package:startercode_project/utils/icons.dart' as AppIcon;
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class DashboardScriptTerbaru extends StatefulWidget {
  DashboardScriptTerbaru({
    Key? key,
    this.showDialog = false,
    this.scriptItem = 0,
  }) : super(key: key);

  int scriptItem;
  bool showDialog;

  @override
  State<DashboardScriptTerbaru> createState() => _DashboardScriptTerbaruState();
}

class _DashboardScriptTerbaruState extends State<DashboardScriptTerbaru> {
  final List<Map> dummyScripts = [
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
  ];

  var scriptIndex;

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
                  style: AppText.Inter12w6_blue_00AEFF,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 170,
          margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: dummyScripts.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              width: 141,
              height: 148,
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 15,
                right: index == dummyScripts.length - 1 ? 20 : 0,
                bottom: 22,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: AppColor.black_38476D.withOpacity(0.09),
                      offset: const Offset(0, 5),
                    ),
                  ]),
              child: Stack(
                children: [
                  ScriptContent(index),
                  ScriptDialog(index),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* Content of Script Popular */
  Widget ScriptContent(int index) {
    return GestureDetector(
      onTap: (() {
        if (!widget.showDialog) {
          debugPrint('clicked script populer');
        }

        setState(() {
          widget.showDialog = false;
          widget.scriptItem = 0;
        });
      }),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            /* title */
            Container(
              height: 78,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(dummyScripts[index]['image']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTapDown: ((detail) {
                      setState(() {
                        widget.showDialog = true;
                        scriptIndex = index;
                      });
                    }),
                    child: Container(
                      width: 16,
                      color: AppColor.transparent,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 3,
                      ),
                      child: AppIcon.dashboard_script_vertical_dots,
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
              padding: const EdgeInsets.symmetric(horizontal: 6),
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
                        color: AppColor.orange_FFF4DE,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Text(dummyScripts[index]['tags'],
                          style: AppText.NunitoSans7w7_orange_FFA800),
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
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Flexible(
                      child: Text(
                    dummyScripts[index]['title'],
                    style: AppText.Inter10w6_black_212121,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /* Dialog of each Content Script */
  Widget ScriptDialog(int index) {
    return Positioned(
      top: 5,
      right: 5,
      child: FadeScaleMotion(
        popup: widget.showDialog && scriptIndex == index,
        child: Container(
          width: 124,
          decoration: const BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(color: AppColor.black_272727),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              ScriptDialogItem(itemText: 'Edit Script', numberItem: 1),
              ScriptDialogItem(itemText: 'Delete Script', numberItem: 2),
            ],
          ),
        ),
      ),
    );
  }

  /* Items of Script Dialog */
  Widget ScriptDialogItem({
    required String itemText,
    required int numberItem,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: (() {
        setState(() => widget.scriptItem = numberItem);

        /* Handle onTap() */
        onTap != null ? onTap() : null;
      }),
      child: Container(
        height: 22,
        width: 106,
        color: widget.scriptItem == numberItem
            ? AppColor.grey_F5F4F6
            : AppColor.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        child: Text(
          itemText,
          style: AppText.Pops10w4_black,
        ),
      ),
    );
  }
}
