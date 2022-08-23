part of 'create_article_cubit.dart';

abstract class CreateArticleState extends Equatable {
  const CreateArticleState();

  @override
  List<Object> get props => [];
}

class CreateArticleInitial extends CreateArticleState {}

class CreateArticleLoading extends CreateArticleState {}

class CreateArticleSuccess extends CreateArticleState {}

class CreateArticleFailure extends CreateArticleState {
  final ErrorType type;
  final String message;

  const CreateArticleFailure(
      {this.type = ErrorType.general, this.message = ""});

  const CreateArticleFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const CreateArticleFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
