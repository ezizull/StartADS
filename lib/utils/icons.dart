// ignore_for_file: non_constant_identifier_names, constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;

/* Dashboard Banner */
const String DashboardBannerURL = 'assets/icons/dashboard/dashboard_banner/';

final Widget dashboard_infinite = SvgPicture.asset(
  DashboardBannerURL + 'dashboard_infinite.svg',
  color: AppColor.black_575757,
  semanticsLabel: 'dashboard infinite icon',
);
final Widget dashboard_search = SvgPicture.asset(
  DashboardBannerURL + 'dashboard_search.svg',
  color: AppColor.black,
  semanticsLabel: 'dashboard search icon',
);
final Widget dashboard_drawer_btn = SvgPicture.asset(
  DashboardBannerURL + 'dashboard_drawer_btn.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard avatar icon',
);

/* Dashboard Script Popular */
const String DashboardScriptsURL = 'assets/icons/dashboard/dashboard_scripts/';

final Widget dashboard_script_horizontal_dots = SvgPicture.asset(
  DashboardScriptsURL + 'dashboard_script_horizontal_dots.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard script horizontal dots icon',
);
final Widget dashboard_script_vertical_dots = SvgPicture.asset(
  DashboardScriptsURL + 'dashboard_script_vertical_dots.svg',
  color: AppColor.black_6F6F6F,
  semanticsLabel: 'dashboard script vertical dots icon',
);

/* Dashboard ADD Script */
const String DashboardAddScriptURL =
    'assets/icons/dashboard/dashboard_add_script/';

final Widget dashboard_plus = SvgPicture.asset(
  DashboardAddScriptURL + 'dashboard_plus.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard plus icon',
);
final Widget dashboard_bottom_dialog_put = SvgPicture.asset(
  DashboardAddScriptURL + 'dashboard_bottom_dialog_put.svg',
  color: AppColor.black_98A6AE,
  semanticsLabel: 'dashboard plus icon',
);

/* Dashboard Drawer */
const String DashboardDrawerURL = 'assets/icons/dashboard/dashboard_drawer/';

final Widget dashboard_drawer_billing = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_billing.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_campaign = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_campaign.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_contact = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_contact.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_down = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_down.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_kamus = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_kamus.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_script = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_script.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_settings = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_settings.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer_up = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer_up.svg',
  semanticsLabel: 'dashboard drawer billing',
);
final Widget dashboard_drawer = SvgPicture.asset(
  DashboardDrawerURL + 'dashboard_drawer.svg',
  semanticsLabel: 'dashboard drawer billing',
);

/* Package */
const String PackageURL = 'assets/icons/paket/';

final Widget package_left_button = SvgPicture.asset(
  PackageURL + 'package_left_button.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'dashboard drawer billing',
);

final Widget haveit_now_white = SvgPicture.asset(
  PackageURL + 'haveit_now.svg',
  color: AppColor.white,
  semanticsLabel: 'dashboard drawer billing',
);

final Widget haveit_now_blue_00AEFF = SvgPicture.asset(
  PackageURL + 'haveit_now.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'dashboard drawer billing',
);

final Widget tick_banner = SvgPicture.asset(
  PackageURL + 'tick_banner.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'dashboard drawer billing',
);
