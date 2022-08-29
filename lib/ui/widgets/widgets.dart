// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;

/* Devider Widget */
class AppDivider extends StatelessWidget {
  const AppDivider({Key? key, this.height = 1, this.margin, this.color})
      : super(key: key);

  final double height;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? AppColor.white_D4D6DD,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}

/* DropDown Expended Motion */
class ExpandMotion extends StatefulWidget {
  final Widget? child;
  final bool expand;
  const ExpandMotion({this.expand = false, this.child});

  @override
  _ExpandMotionState createState() => _ExpandMotionState();
}

class _ExpandMotionState extends State<ExpandMotion>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  int duration = 500;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: duration),
      reverseDuration: const Duration(seconds: 1), // must in second
    );

    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandMotion oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.reverse();
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
