import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/repositories/article_repository.dart';
import 'paket_state.dart';

class PaketCubit extends Cubit<PaketState> {
  PaketCubit() : super(PaketInitial());

  final ArticleRepository _article = ArticleRepository();

  Future<void> fetchPaket() async {
    emit(PaketLoading());
    try {
      final response = await _article.fetchListArticle();

      emit(ExpiredPaket());
      // emit(const HavePaket("Cubit: Succes to Fetch Paket"));
    } catch (error) {
      if (error is NetworkException) {
        emit(PaketFailure.network(error.toString()));
        return;
      }
      emit(PaketFailure.general(error.toString()));
    }
  }
}
