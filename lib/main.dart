import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/ui/screens/screens.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  //Handling certificate_failed
  HttpOverrides.global = ApiHttpOverrides();

  await dotenv.load(fileName: ".env");

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  await initializeDateFormatting('in_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}

class Config {
  static final String? baseUrl =
      kDebugMode ? dotenv.env['BASE_URL_DEBUG'] : dotenv.env['BASE_URL'];
  static final String? adsKey = dotenv.env['ADS_KEY'];
}
