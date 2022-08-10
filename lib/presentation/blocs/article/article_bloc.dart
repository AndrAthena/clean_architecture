import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/enums/request_state_enum.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/domain/usecases/get_articles.dart';
import 'package:stream_transform/stream_transform.dart';

part 'article_event.dart';
part 'article_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase<DioError> _getArticlesUseCase;
  int _page = 1;
  static const _pageSize = 20;

  ArticleBloc(
    this._getArticlesUseCase,
  ) : super(const ArticleState(state: RequestState.none)) {
    on<GetArticles>(
      _onGetArticles,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  Future<void> _onGetArticles(
    GetArticles event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(state: RequestState.loading));

    if (state.articles.length % _pageSize > _page) _page += 1;

    final result = await _getArticlesUseCase(
      ArticleRequestParams(
        page: _page,
        pageSize: _pageSize,
      ),
    );

    if (result.isSuccess) {
      final data = result.get() as List<Article>;
      emit(state.copyWith(
        state: RequestState.done,
        articles: List.of([...state.articles, ...data]),
      ));
    } else {
      emit(state.copyWith(
        state: RequestState.error,
        error: result.get() as DioError,
      ));
    }
  }
}
