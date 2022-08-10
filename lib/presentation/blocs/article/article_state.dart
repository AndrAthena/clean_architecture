part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final RequestState state;
  final List<Article> articles;
  final DioError? error;

  const ArticleState({
    this.state = RequestState.none,
    this.articles = const [],
    this.error,
  });

  ArticleState copyWith({
    RequestState? state,
    List<Article>? articles,
    DioError? error,
  }) {
    return ArticleState(
      state: state ?? this.state,
      articles: articles ?? this.articles,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [state, articles, error];
}
