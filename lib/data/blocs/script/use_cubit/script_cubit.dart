// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/data/blocs/script/use_cubit/script_state.dart';
import 'package:Scriptmatic/data/repositories/article_repository.dart';

class ScriptCubit extends Cubit<ScriptState> {
  ScriptCubit() : super(ScriptInitial());

  final ArticleRepository _article = ArticleRepository();

  final List<Map> scriptPopular = [
    {
      'title': 'Fashion Wanita',
      'greet': 'Greeting',
      'body':
          'Hallo Sis, stock {nama produk} masih ready? Info cara pemesanan donk'
    },
    {
      'title': 'Mainan Anak',
      'greet': 'Greeting',
      'body':
          'Hallo, Saya tertarik dengan { nama produk}, apakah masih tersedia?'
    },
    {
      'title': 'Sports',
      'greet': 'Greeting',
      'body':
          'Hallo, Saya tertarik dengan {nama produk}, apakah stocknya masih tersedia?'
    },
  ];

  final List<Map> scriptTerbaru = [
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
    {
      'image':
          'assets/images/dashboard/dashboard_scripts/dashboard_script_terbaru_girl.png',
      'tags': 'Greeting',
      'title': 'Gamis Fashion',
    },
  ];

  Future<void> fetchScript() async {
    emit(ScriptLoading());

    try {
      emit(ScriptLoaded(
        scriptPopular: scriptPopular,
        scriptTerbaru: scriptTerbaru,
      ));
    } catch (error) {
      // network error
      if (error is NetworkException) {
        emit(ScriptFailure.network(error.toString()));
        return;
      }

      // general error
      emit(ScriptFailure.general(error.toString()));
    }
  }

  void onTapButton(String text) async {
    try {
      debugPrint(text);
    } catch (error) {
      // general error
      emit(ScriptFailure.general(error.toString()));
    }
  }
}
