import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_state.dart';
import 'package:Scriptmatic/data/repositories/article_repository.dart';

class FetchScriptsCubit extends Cubit<FetchScriptsState> {
  FetchScriptsCubit() : super(FetchScriptsInitial());

  final ArticleRepository _article = ArticleRepository();

  Future<void> fetchScripts() async {
    emit(FetchScriptsLoading());
    try {
      // dummy request
      final response = await _article.fetchListArticle();

      emit(const FetchScriptsSuccess("Cubit: Succes to Fetch Scripts"));
    } catch (error) {
      if (error is NetworkException) {
        emit(FetchScriptsFailure.network(error.toString()));
        return;
      }
      emit(FetchScriptsFailure.general(error.toString()));
    }
  }
}
