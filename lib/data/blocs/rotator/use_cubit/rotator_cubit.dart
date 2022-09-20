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

  late List<TextEditingController> controllerRotator;
  late List<String> contentsRotator;

  bool get canSubmitAddRotator =>
      controllerRotator.where((element) => element.text == "").isEmpty &&
              contentsRotator.where((element) => element == "").isEmpty
          ? true
          : false;

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
    for (var element in controllerRotator) {
      element.dispose();
    }
  }
}
