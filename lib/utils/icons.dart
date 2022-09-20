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
final Widget drawer_billing_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_billing.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer billing active',
);
final Widget drawer_campaign_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_campaign.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer campaign active',
);
final Widget drawer_contact_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_contact.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer contact active',
);
final Widget drawer_down_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_down.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer down active',
);
final Widget drawer_kamus_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_kamus.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer kamus active',
);
final Widget drawer_script_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_script.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer script active',
);
final Widget drawer_settings_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_settings.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer settings active',
);
final Widget drawer_up_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_up.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer up btn active',
);
final Widget drawer_dashboard_active = SvgPicture.asset(
  AppDrawerURL + 'drawer_dashboard.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'drawer dashboard active',
);
final Widget drawer_rotate_active = SvgPicture.asset(
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
final Widget haveit_now_active = SvgPicture.asset(
  PackageURL + 'haveit_now.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'package haveit now active',
);
final Widget tick_banner = SvgPicture.asset(
  PackageURL + 'tick_banner.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'packge tick banner',
);

// Rotator
const String RotatorURL = 'assets/icons/rotator/';

final Widget rotator_down = SvgPicture.asset(
  RotatorURL + 'rotator_down.svg',
  semanticsLabel: 'rotator down',
);
final Widget rotator_down_active = SvgPicture.asset(
  RotatorURL + 'rotator_down.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator down active',
);
final Widget rotator_filter = SvgPicture.asset(
  RotatorURL + 'rotator_filter.svg',
  semanticsLabel: 'rotator filter',
);
final Widget rotator_filter_active = SvgPicture.asset(
  RotatorURL + 'rotator_filter.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator filter active',
);
final Widget rotator_sort = SvgPicture.asset(
  RotatorURL + 'rotator_sort.svg',
  semanticsLabel: 'rotator sort',
);
final Widget rotator_sort_active = SvgPicture.asset(
  RotatorURL + 'rotator_sort.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator sort active',
);
final Widget rotator_add = SvgPicture.asset(
  RotatorURL + 'rotator_add.svg',
  semanticsLabel: 'rotator add',
);
final Widget rotator_add_active = SvgPicture.asset(
  RotatorURL + 'rotator_add.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator add active',
);
final Widget rotator_edit = SvgPicture.asset(
  RotatorURL + 'rotator_edit.svg',
  semanticsLabel: 'rotator edit',
);
final Widget rotator_edit_active = SvgPicture.asset(
  RotatorURL + 'rotator_edit.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator edit active',
);
// Rotator ADD
const String RotatorAddURL = 'assets/icons/rotator/rotator_add/';

final Widget rotator_info = SvgPicture.asset(
  RotatorAddURL + 'rotator_info.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator checkbox',
);

final Widget rotator_info_show = SvgPicture.asset(
  RotatorAddURL + 'rotator_info.svg',
  color: AppColor.orange_FF8C51,
  semanticsLabel: 'rotator checkbox',
);
final Widget rotator_checkbox = SvgPicture.asset(
  RotatorAddURL + 'rotator_checkbox.svg',
  color: AppColor.grey_9F9FB9,
  semanticsLabel: 'rotator checkbox',
);
final Widget rotator_checkbox_active = SvgPicture.asset(
  RotatorAddURL + 'rotator_checkbox_active.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator checkbox active',
);
final Widget rotator_radio = SvgPicture.asset(
  RotatorAddURL + 'rotator_radio.svg',
  color: AppColor.grey_9F9FB9,
  semanticsLabel: 'rotator checkbox',
);
final Widget rotator_radio_active = SvgPicture.asset(
  RotatorAddURL + 'rotator_radio_active.svg',
  color: AppColor.blue_00AEFF,
  semanticsLabel: 'rotator checkbox active',
);
final Widget rotator_eye_close = SvgPicture.asset(
  RotatorAddURL + 'rotator_eye_close.svg',
  semanticsLabel: 'rotator checkbox',
);
final Widget rotator_eye_preview = SvgPicture.asset(
  RotatorAddURL + 'rotator_eye_preview.svg',
  semanticsLabel: 'rotator checkbox active',
);
