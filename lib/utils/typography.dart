// ignore_for_file: library_prefixes, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'colors.dart' as AppColor;

const String _fontPoppins = 'Poppins';

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
const TextStyle PopsTitle = TextStyle(
  fontFamily: _fontPoppins,
  fontSize: textSizeXLarge,
  fontWeight: FontWeight.w600,
  color: AppColor.white,
);

const TextStyle PopsHeading2 = TextStyle(
  fontFamily: _fontPoppins,
  fontSize: textSizeLarge,
  fontWeight: FontWeight.w600,
  color: AppColor.white,
);

TextStyle PopsTopBar = TextStyle(
  fontFamily: _fontPoppins,
  fontSize: 22.0,
  fontWeight: FontWeight.w900,
  color: AppColor.primary,
);

const TextStyle PopsButton = TextStyle(
  fontFamily: _fontPoppins,
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  color: AppColor.white,
);

const TextStyle PopsBody = TextStyle(
  fontFamily: _fontPoppins,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: AppColor.textPrimary,
);
