// ignore_for_file: non_constant_identifier_names, constant_identifier_names

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Scriptmatic/main.dart';

final String BASE_URL = Config.baseUrl!;
final String ADS_KEY = Config.adsKey!;

final String API_URL = "$BASE_URL/api/v1";
final String API_ADS_KEY = ADS_KEY;

final String STORAGE_URL = "$BASE_URL/storage";

/// size in milimeters
const A4_PAPER_SIZE = Size(210, 297);

// APP Drawer

// list of dropped items
const List<String> ScriptList = ['Script Chat', 'Script Campaign'];
const List<String> ContactList = ['Kontak Pelanggan', 'Grup Pelanggan'];
const List<String> UserList = ['Ammed'];

// Text
const String Dashboard = 'Dashboard';
const String Script = 'Script';
const String Kamus = 'Kamus CS';
const String Rotator = 'Rotator CS';
const String RotatorAdd = 'Tambah Link Rotator';
const String Contact = 'Contact Management';
const String Campaign = 'Campaign';
const String Billing = 'Billing';
const String Settings = 'Settings';

// Rotator
const String Produk = 'Produk';
const String Track = 'Tracking';
