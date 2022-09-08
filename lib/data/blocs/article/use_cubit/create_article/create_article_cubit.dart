// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:Scriptmatic/api/api.dart';
import 'package:Scriptmatic/data/repositories/article_repository.dart';

part 'create_article_state.dart';

class CreateArticleCubit extends Cubit<CreateArticleState> {
  CreateArticleCubit() : super(CreateArticleInitial());

  final ArticleRepository _articleRepository = ArticleRepository();

  Future<void> addArticle(
      {required String title, required String bodyArticle}) async {
    emit(CreateArticleLoading());
    try {
      await _articleRepository.createArticle(
          title: title, bodyArticle: bodyArticle);
      emit(CreateArticleSuccess());
    } catch (e) {
      if (e is NetworkException) {
        emit(CreateArticleFailure.network(e.toString()));
        return;
      }
      emit(CreateArticleFailure.general(e.toString()));
    }
  }
}
