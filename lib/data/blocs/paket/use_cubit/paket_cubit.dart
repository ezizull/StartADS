// ignore_for_file: unused_local_variable

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/data/repositories/article_repository.dart';
import 'paket_state.dart';

class PaketCubit extends Cubit<PaketState> {
  PaketCubit() : super(PaketInitial());

  // example get request
  final ArticleRepository _article = ArticleRepository();

  // dummy data
  final List<Map> usablePaket = [
    {
      'title': '6 Bulan',
      'discount': '594.000',
      'price': '297.000',
      'body': [
        [
          'Akses Scriptmatic 6 Bulan',
          '5 Customer Service',
          'Ratusan Template Script Follow Up Customer',
          ''
        ],
        [
          'Kamus CS (Kamus Penolakan)',
          'Free Update',
          'Chat Support',
          'Panduan Lengkap'
        ],
      ]
    },
    {
      'title': '1 Tahun',
      'discount': '794.000',
      'price': '297.000',
      'body': [
        [
          'Akses Scriptmatic 6 Bulan',
          '5 Customer Service',
          'Ratusan Template Script Follow Up Customer',
          ''
        ],
        [
          'Kamus CS (Kamus Penolakan)',
          'Free Update',
          'Chat Support',
          'Panduan Lengkap'
        ],
      ]
    },
  ];

  Future<void> paketStatus() async {
    emit(PaketLoading());
    try {
      final response = await _article.fetchListArticle();

      // paket has expired
      emit(ExpiredPaket());

      // have a paket
      // emit(const HavePaket("Cubit: Succes Loaded Paket"));
    } catch (error) {
      if (error is NetworkException) {
        emit(PaketFailure.network(error.toString()));
        return;
      }
      emit(PaketFailure.general(error.toString()));
    }
  }

  Future<void> fetchPaket() async {
    emit(PaketLoading());
    try {
      emit(UsablePaket(usablePaket));
    } catch (e) {}
  }
}
