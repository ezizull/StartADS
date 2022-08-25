// ignore_for_file: library_prefixes, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart' as AppColor;

const double textSizeSmall = 7.0;
const double textSizeMedium = 10.0;
const double textSizeLargeMedium = 12.0;
const double textSizeNormal = 13.0;
const double textSizeLarge = 15.0;
const double textSizeXLarge = 28.0;
const double textSizeTitle = 14.0;

// textSizeSmall = 12.0;
// textSizeSMedium = 14.0;
// textSizeMedium = 16.0;
// textSizeLargeMedium = 18.0;
// textSizeNormal = 20.0;
// textSizeLarge = 24.0;
// textSizeXLarge = 30.0;
// textSizeTitle = 28.0;

// font Poppins
TextStyle PopsTitle = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: textSizeXLarge,
  fontWeight: FontWeight.w600,
  color: AppColor.white,
));

TextStyle PopsHeading2 = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: textSizeLarge,
  fontWeight: FontWeight.w600,
  color: AppColor.white,
));

TextStyle PopsTopBar = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w900,
  color: AppColor.primary,
));

TextStyle PopsIcon = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: textSizeLargeMedium,
  fontWeight: FontWeight.w400,
  color: AppColor.textPrimary,
));

TextStyle PopsButton = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w800,
  color: AppColor.textPrimary,
));

TextStyle PopsBody = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: textSizeTitle,
  fontWeight: FontWeight.w400,
  color: AppColor.textPrimary,
));

TextStyle PopsDashboardScriptBody = GoogleFonts.poppins(
    textStyle: const TextStyle(
  fontSize: textSizeMedium,
  fontWeight: FontWeight.w400,
  color: AppColor.white,
));

// font Inter
TextStyle InterTextField = GoogleFonts.inter(
    textStyle: const TextStyle(
  fontSize: textSizeTitle,
  fontWeight: FontWeight.w400,
  color: AppColor.black,
));

TextStyle InterTextFieldHint = GoogleFonts.inter(
    textStyle: const TextStyle(
  fontSize: textSizeTitle,
  fontWeight: FontWeight.w400,
  color: AppColor.lightGrey,
));

TextStyle InterDashboardScriptTitle = GoogleFonts.inter(
    textStyle: const TextStyle(
  fontSize: textSizeNormal,
  fontWeight: FontWeight.w700,
  color: AppColor.white,
));

TextStyle InterSeeMore = GoogleFonts.inter(
    textStyle: const TextStyle(
  fontSize: textSizeLargeMedium,
  fontWeight: FontWeight.w600,
  color: AppColor.primary,
));

// font Lato
TextStyle LatoTitle = GoogleFonts.lato(
    textStyle: const TextStyle(
  fontWeight: FontWeight.w700,
));

// font Nunito
TextStyle NunitoDashboardScriptGreeting = GoogleFonts.nunito(
    textStyle: const TextStyle(
  fontSize: textSizeNormal,
  fontWeight: FontWeight.w600,
  color: AppColor.white,
));
