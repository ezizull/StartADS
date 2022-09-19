import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/typography.dart' as AppText;

class RotatorTitle extends StatelessWidget {
  const RotatorTitle(
    this.title, {
    Key? key,
    this.showTitle = true,
    this.icon,
    this.spacing = 8,
    this.onTap,
    this.iconTap,
  }) : super(key: key);

  final String title;
  final bool showTitle;
  final Widget? icon;
  final double spacing;
  final Function? onTap;
  final Function? iconTap;

  @override
  Widget build(BuildContext context) {
    var localChildren = [
      Text(title, style: AppText.Inter12w7h14_black_2F3036),

      // with onTap
      if (onTap != null) ...[
        SizedBox(width: 11, height: 11, child: icon)
      ]

      // whit iconTap
      else if (icon != null) ...[
        GestureDetector(
          onTap: () => iconTap != null ? iconTap!() : null,
          child: SizedBox(width: 11, height: 11, child: icon),
        )
      ]
    ];

    return showTitle
        ? GestureDetector(
            onTap: () => onTap != null ? onTap!() : null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: spacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: localChildren,
              ),
            ),
          )
        : Container();
  }
}
