// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

// background
const blue_CCFCFF = Color(0xFFCCFCFF);
const blue_00AEFF = Color(0xFF00AEFF);
const blue_0065B7 = Color(0xFF0065B7);

const purple_E8A3FD = Color(0xFFE8A3FD);
const purple_C547FF = Color(0xFFC547FF);
const purple_951FFE = Color(0xFF951FFE);

const orange_F5C450 = Color(0xFFF5C450);
const orange_F9A254 = Color(0xFFF9A254);
const orange_F67F55 = Color(0xFFF67F55);

// tags
const orange_FFA800 = Color(0xFFFFA800);
const orange_FFF4DE = Color(0xFFFFF4DE);

// linear gradient
LinearGradient dashboardBanner = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.centerRight,
  stops: const [
    0.1,
    0.4,
    0.9,
  ],
  colors: [
    blue_CCFCFF.withOpacity(0.5),
    blue_00AEFF,
    blue_0065B7,
  ],
);

List<LinearGradient> scriptPopular = [
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      purple_951FFE,
      purple_C547FF,
      purple_E8A3FD,
    ],
  ),
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      orange_F67F55,
      orange_F9A254,
      orange_F5C450,
    ],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      blue_0065B7,
      blue_00AEFF,
      blue_CCFCFF.withOpacity(0.5),
    ],
  ),
];

// line
const white_D4D6DD = Color(0xFFD4D6DD);

// common
const black = Color(0xFF000000);
const black_212121 = Color(0xFF212121);
const black_222831 = Color(0xFF222831);
const black_272727 = Color(0xFF272727);
const black_38476D = Color(0xFF38476D);
const black_575757 = Color(0xFF575757);
const black_6F6F6F = Color(0xFF6F6F6F);
const black_98A6AE = Color(0xFF98A6AE);

const grey_777C7E = Color(0xFF777C7E);
const grey_8F9098 = Color(0xFF8F9098);
const grey_F5F4F6 = Color(0xFFF5F4F6);
const grey_E0E2E2 = Color(0xFFE0E2E2);
const grey_E5E5E5 = Color(0xFFE5E5E5);

const red_EB4F4D = Color(0xFFEB4F4D);
const yellow_F3AF48 = Color(0xFFF3AF48);
const blue_2A90EE = Color(0xFF2A90EE);

const gold = Color(0xFFFBE570);
const danger = Color(0xFFE64036);
const warning = Color(0xFFFEC107);
const success = Color(0xFF479E10);

const white = Color(0xFFFFFFFF);
const transparent = Colors.transparent;
