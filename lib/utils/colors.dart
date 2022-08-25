import 'package:flutter/material.dart';

// main color
const appPrimary = Color(0xFF00AEFF);
const primary = Color(0xFF00AEFF);

// background
const whiteBlueBg = Color(0xFFCCFCFF);
const blueBg = Color(0xFF00AEFF);
const darkBlueBg = Color(0xFF0065B7);

const whitePurpleBg = Color(0xFFE8A3FD);
const purpleBg = Color(0xFFC547FF);
const darkPurpleBg = Color(0xFF951FFE);

const whiteOrangeBg = Color(0xFFF5C450);
const orangeBg = Color(0xFFF9A254);
const darkOrangeBg = Color(0xFFF67F55);

// tags
const orangeText = Color(0xFFFFA800);
const ligthOrangeBg = Color(0xFFFFF4DE);

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
    whiteBlueBg.withOpacity(0.5),
    blueBg,
    darkBlueBg,
  ],
);

List<LinearGradient> scriptPopular = [
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      darkPurpleBg,
      purpleBg,
      whitePurpleBg,
    ],
  ),
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      darkOrangeBg,
      orangeBg,
      whiteOrangeBg,
    ],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      darkBlueBg,
      blueBg,
      whiteBlueBg.withOpacity(0.5),
    ],
  ),
];

// line
const line = Color(0xFFD4D6DD);

// common
const black = Color(0xFF000000);
const black2 = Color(0xFF212121);
const black3 = Color(0xFF38476D17);
const black4 = Color(0xFF575757);
const black5 = Color(0xFF6F6F6F);
const grey = Color(0xFF777C7E);
const lightGrey = Color(0xFF8F9098);
const lightGrey2 = Color(0xFFE0E2E2);
const red = Color(0xFFEB4F4D);
const gold = Color(0xFFFBE570);
const danger = Color(0xFFE64036);
const warning = Color(0xFFFEC107);
const success = Color(0xFF479E10);
const yellow = Color(0xFFF3AF48);
const white = Color(0xFFFFFFFF);
const blue = Color(0xFF2A90EE);
const transparent = Colors.transparent;
