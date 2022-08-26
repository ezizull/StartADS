import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/ui/screens/screens.dart';

void main() async {
  //Handling certificate_failed
  HttpOverrides.global = ApiHttpOverrides();

  await dotenv.load(fileName: ".env");

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );

  await initializeDateFormatting('in_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardMenuScreen(),
    );
  }
}

class Config {
  static final String? baseUrl =
      kDebugMode ? dotenv.env['BASE_URL_DEBUG'] : dotenv.env['BASE_URL'];
  static final String? adsKey = dotenv.env['ADS_KEY'];
}
