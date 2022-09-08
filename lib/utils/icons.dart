// ignore_for_file: non_constant_identifier_names, constant_identifier_names, library_prefixes

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:Scriptmatic/utils/colors.dart' as AppColor;

// Dashboard Banner
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

// Dashboard Script Popular
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

// Dashboard ADD Script
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

// App Drawer
// Button acive, disable
const String AppDrawerURL = 'assets/icons/drawer/';

// disable drawer button
final Widget drawer_billing = SvgPicture.asset(
  AppDrawerURL + 'drawer_billing.svg',
  semanticsLabel: 'drawer billing',
);
final Widget drawer_campaign = SvgPicture.asset(
  AppDrawerURL + 'drawer_campaign.svg',
  semanticsLabel: 'drawer campaign',
);
final Widget drawer_contact = SvgPicture.asset(
  AppDrawerURL + 'drawer_contact.svg',
  semanticsLabel: 'drawer contact',
);
final Widget drawer_down = SvgPicture.asset(
  AppDrawerURL + 'drawer_down.svg',
  semanticsLabel: 'drawer down',
);
final Widget drawer_kamus = SvgPicture.asset(
  AppDrawerURL + 'drawer_kamus.svg',
  semanticsLabel: 'drawer kamus',
);
final Widget drawer_script = SvgPicture.asset(
  AppDrawerURL + 'drawer_script.svg',
  semanticsLabel: 'drawer script',
);
final Widget drawer_settings = SvgPicture.asset(
  AppDrawerURL + 'drawer_settings.svg',
  semanticsLabel: 'drawer settings',
);
final Widget drawer_up = SvgPicture.asset(
  AppDrawerURL + 'drawer_up.svg',
  semanticsLabel: 'drawer up btn',
);
final Widget drawer_dashboard = SvgPicture.asset(
  AppDrawerURL + 'drawer_dashboard.svg',
  semanticsLabel: 'drawer dashboard',
);
final Widget drawer_rotate = SvgPicture.asset(
  AppDrawerURL + 'drawer_rotate.svg',
  semanticsLabel: 'drawer rotate',
);

// active drawer button
final Widget drawer_billing_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_billing.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer billing active',
);
final Widget drawer_campaign_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_campaign.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer campaign active',
);
final Widget drawer_contact_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_contact.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer contact active',
);
final Widget drawer_down_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_down.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer down active',
);
final Widget drawer_kamus_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_kamus.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer kamus active',
);
final Widget drawer_script_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_script.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer script active',
);
final Widget drawer_settings_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_settings.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer settings active',
);
final Widget drawer_up_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_up.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer up btn active',
);
final Widget drawer_dashboard_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_dashboard.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer dashboard active',
);
final Widget drawer_rotate_blue_00AEFF = SvgPicture.asset(
  AppDrawerURL + 'drawer_rotate.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer rotate active',
);

// Package
const String PackageURL = 'assets/icons/paket/';

final Widget package_left_button = SvgPicture.asset(
  PackageURL + 'package_left_button.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'package left btn',
);
final Widget haveit_now_white = SvgPicture.asset(
  PackageURL + 'haveit_now.svg',
  color: AppColor.white,
  semanticsLabel: 'package haveit now',
);
final Widget haveit_now_blue_00AEFF = SvgPicture.asset(
  PackageURL + 'haveit_now.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'package haveit now active',
);
final Widget tick_banner = SvgPicture.asset(
  PackageURL + 'tick_banner.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'packge tick banner',
);
