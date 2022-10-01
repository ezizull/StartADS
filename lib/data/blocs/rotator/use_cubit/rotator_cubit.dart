// ignore_for_file: unused_local_variable

// Package imports:
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RotatorCubit extends Cubit<RotatorState> {
  RotatorCubit() : super(RotatorInitial());
  String isiPesan = '';

  List<String> listProduct = [
    'Gamis Aqila1',
    'Gamis Aqila2',
    'Gamis Aqila3',
    'Gamis Aqila4',
    'Gamis Aqila5'
  ];

  List<Map> listCS = [
    {
      'title': 'Susi Susanti',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_susi_susanti.png',
    },
    {
      'title': 'Dwi Listya',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_dwi_listya.png',
    },
    {
      'title': 'Savannah Nguyen',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_savannah_nguyen.png',
    },
  ];

  List<Map> listPilihScript = [
    {
      'id': 1,
      'title': 'Greeting 1',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 2,
      'title': 'Greeting 2',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 3,
      'title': 'Greeting 3',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 4,
      'title': 'Greeting 4',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 5,
      'title': 'Greeting 5',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 6,
      'title': 'Greeting 6',
      'copied': '10',
      'status': 'Tutup',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 7,
      'title': 'Greeting 7',
      'copied': '10',
      'status': 'Preview',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 8,
      'title': 'Greeting 8',
      'copied': '10',
      'status': 'Preview',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
    {
      'id': 9,
      'title': 'Greeting 9',
      'copied': '10',
      'status': 'Preview',
      'pesan':
          'Hallo, Saya tertarik dengan Nacific Toner, bisa dijelaskan apa saja manfaatnya lebih dulu?',
    },
  ];

  late List<TextEditingController> controllerRotator;
  late List<dynamic> multipleRotator;
  late List<String?> contentsRotator;
  late List<bool> conditionRotator;
  late List<int?> numberRotator;
  late String showDialog = '';

  /// Makesure index[0] used for canSubmit (validate)
  /// Example:
  /// ```dart
  /// var canSubmit = cubit.conditionRotator[0];
  /// canSubmit = cubit.conditionTrue && cubit.multipleTrue && cubit.contentsTrue;
  /// ```
  bool get conditionTrue => conditionRotator.where((element) {
        return element == false && conditionRotator.indexOf(element) > 0;
      }).isEmpty
          ? true
          : false;

  bool get contentsTrue =>
      contentsRotator.where((element) => element == null).isEmpty
          ? true
          : false;

  bool get controllerTrue =>
      controllerRotator.where((element) => element.text == "").isEmpty
          ? true
          : false;

  /// Check:
  /// debugPrint((element[i].runtimeType).toString());
  bool get multipleTrue => multipleRotator.where((element) {
        for (var i = 0; i < element.length; i++) {
          if (element[i] is List) return element[i].isEmpty;

          if (element[i] is String) {
            return element[i] == null.toString() || element[i] == "";
          }

          if (element[i] is String?) {
            return element[i] == null.toString() || element[i] == null;
          }

          if (element[i] is TextEditingController) {
            return element[i].text == '"';
          }
        }
        return element.isEmpty;
      }).isEmpty
          ? true
          : false;

  bool get numberTrue =>
      numberRotator.where((element) => element == null).isEmpty ? true : false;

  Future<void> fetchRotator() async {
    emit(RotatorLoading());
    try {
      emit(RotatorLoaded(listCS: listCS, listProduct: listProduct));
    } catch (error) {
      // network error
      if (error is NetworkException) {
        return emit(RotatorFailure.network(error.toString()));
      }
      // general error
      emit(RotatorFailure.general(error.toString()));
    }
  }

  setRotatorMethod({String param = '', Map pilihScript = const {}}) {
    try {
      if (param == CustomScript) {
        return emit(RotatorLoaded(
          isiPesan: param,
          listCS: listCS,
          listProduct: listProduct,
        ));
      }

      if (param == PilihScript) {
        return emit(RotatorLoaded(
          isiPesan: param,
          listCS: listCS,
          listProduct: listProduct,
          pilihScript: pilihScript,
        ));
      }

      return emit(RotatorLoaded(
        listCS: listCS,
        listProduct: listProduct,
        pilihScript: pilihScript,
      ));
    } catch (error) {
      // general error
      emit(RotatorFailure.general(error.toString()));
    }
  }

  void dispose() {
    for (var element in controllerRotator) element.dispose();
  }
}
