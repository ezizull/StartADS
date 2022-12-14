// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/data/models/article.dart';
import 'package:Scriptmatic/data/repositories/article_repository.dart';

part 'fetch_articles_state.dart';

class FetchArticlesCubit extends Cubit<FetchArticlesState> {
  FetchArticlesCubit() : super(FetchArticlesInitial());

  final ArticleRepository _article = ArticleRepository();

  Future<void> fetchArticles() async {
    emit(FetchArticlesLoading());
    try {
      final response = await _article.fetchListArticle();
      emit(FetchArticlesSuccess(response.data));
    } catch (error) {
      if (error is NetworkException) {
        emit(FetchArticlesFailure.network(error.toString()));
        return;
      }
      emit(FetchArticlesFailure.general(error.toString()));
    }
  }
}
