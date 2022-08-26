// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;

const String baseAssetURL = 'assets/icons/dashboard/';

/* Dashboard Banner */
final Widget dashboard_infinite_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_infinite_icon.svg',
  color: AppColor.black_575757,
  semanticsLabel: 'dashboard infinite icon',
);

final Widget dashboard_search_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_search_icon.svg',
  color: AppColor.black,
  semanticsLabel: 'dashboard search icon',
);

final Widget dashboard_avatar_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_avatar_icon.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard avatar icon',
);

/* Dashboard Script Popular */
final Widget dashboard_script_horizontal_dots_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_script_horizontal_dots_icon.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard script horizontal dots icon',
);

final Widget dashboard_script_vertical_dots_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_script_vertical_dots_icon.svg',
  color: AppColor.black_6F6F6F,
  semanticsLabel: 'dashboard script vertical dots icon',
);

/* Dashboard ADD Script */
final Widget dashboard_plus_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_plus_icon.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard plus icon',
);

final Widget dashboard_bottom_dialog_put_icon = SvgPicture.asset(
  baseAssetURL + 'dashboard_bottom_dialog_put_icon.svg',
  color: AppColor.black_98A6AE,
  semanticsLabel: 'dashboard plus icon',
);
