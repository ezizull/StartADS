// ignore_for_file: library_prefixes, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'colors.dart' as AppColor;

const String _fontQuicksand = 'Quicksand';

// textSizeSmall = 12.0;
// textSizeSMedium = 14.0;
// textSizeMedium = 16.0;
// textSizeLargeMedium = 18.0;
// textSizeNormal = 20.0;
// textSizeLarge = 24.0;
// textSizeXLarge = 30.0;
// textSizeTitle = 34.0;

//Font Quicksand
TextStyle QsTopBar = TextStyle(
  fontFamily: _fontQuicksand,
  fontSize: 22.0,
  fontWeight: FontWeight.w900,
  color: AppColor.primary,
);

const TextStyle QsButton = TextStyle(
  fontFamily: _fontQuicksand,
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  color: AppColor.textPrimary,
);

const TextStyle QsTitle = TextStyle(
  fontFamily: _fontQuicksand,
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: AppColor.textPrimary,
);

const TextStyle QsBody = TextStyle(
  fontFamily: _fontQuicksand,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: AppColor.textPrimary,
);
