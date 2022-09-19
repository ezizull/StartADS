// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_typing_uninitialized_variables, library_prefixes, unused_import

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Scriptmatic/data/blocs/script/use_cubit/script_cubit.dart';
import 'package:Scriptmatic/data/blocs/script/use_cubit/script_state.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/transitions.dart';
import 'package:Scriptmatic/utils/typography.dart' as AppText;

class DashboardScriptPopular extends StatefulWidget {
  int scriptItem;
  ScriptLoaded? state;
  ScriptCubit? cubit;
  bool showDialog;

  DashboardScriptPopular({
    this.showDialog = false,
    Key? key,
    this.state,
    this.cubit,
    this.scriptItem = 0,
  }) : super(key: key);

  @override
  State<DashboardScriptPopular> createState() => _DashboardScriptPopularState();
}

class _DashboardScriptPopularState extends State<DashboardScriptPopular> {
  var scriptIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // header section
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
                  style: AppText.Inter12w6_blue_00AEFF,
                ),
              ),
            ],
          ),
        ),

        // body section
        Container(
          height: 125,
          margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: widget.state!.scriptPopular.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              width: 224,
              height: 125,
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 15,
                right: index == widget.state!.scriptPopular.length - 1 ? 20 : 0,
              ),
              decoration: BoxDecoration(
                color: AppColor.blue_00AEFF,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [Content(index, widget.cubit), Dialog(index)],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Content of Script Popular
  Widget Content(int index, ScriptCubit? cubit) {
    return GestureDetector(
      onTap: (() {
        if (!widget.showDialog) {
          cubit!.onTapButton('clicked script populer');
        }

        setState(() {
          widget.showDialog = false;
          widget.scriptItem = 0;
        });
      }),
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
            // title
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.state!.scriptPopular[index]['title'],
                    style: AppText.Inter13w7_white,
                  ),
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
                        horizontal: 1.5,
                        vertical: 6.5,
                      ),
                      child: AppIcon.dashboard_script_horizontal_dots,
                    ),
                  )
                ],
              ),
            ),
            // greeting
            Container(
              height: 18,
              width: 192,
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Flexible(
                      child: Text(
                    widget.state!.scriptPopular[index]['greet'],
                    style: AppText.Nunito13w6_black,
                  )),
                ],
              ),
            ),
            // body
            // ignore: sized_box_for_whitespace
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    Flexible(
                        child: Text(
                      widget.state!.scriptPopular[index]['body'],
                      style: AppText.Pops10w4_white,
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Dialog of each Content Script
  Widget Dialog(int index) {
    return Positioned(
      top: 5,
      right: 5,
      child: FadeScaleMotion(
        alignment: Alignment.topRight,
        popup: widget.showDialog && scriptIndex == index,
        child: Container(
          width: 124,
          color: AppColor.white,
          padding: const EdgeInsets.all(10),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              DialogItem(itemText: 'Save Script', numberItem: 1),
              DialogItem(itemText: 'Edit Script', numberItem: 2),
              DialogItem(itemText: 'Delete Script', numberItem: 3),
            ],
          ),
        ),
      ),
    );
  }

  // Items of Script Dialog
  Widget DialogItem({
    required String itemText,
    required int numberItem,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: (() {
        setState(() => widget.scriptItem = numberItem);

        // Handle onTap()
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
          style: AppText.Pops12w4_black,
        ),
      ),
    );
  }
}
