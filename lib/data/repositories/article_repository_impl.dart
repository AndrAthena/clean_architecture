import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/params/article_request.dart';
import '../../core/resources/result.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/remote/news_api_service.dart';
import '../models/breaking_news_model.dart';

class ArticleRepositoryImpl implements ArticlesRepository<DioError> {
  final NewsApiService _service;

  ArticleRepositoryImpl(this._service);

  @override
  Future<Result<DioError, List<Article>>> getBreakingNewsArticles(
    ArticleRequestParams params,
  ) async {
    try {
      final result = await _service.getBreakingNewsArticle(
        country: params.country,
        category: params.category,
        pageSize: params.pageSize,
        page: params.page,
      );
      if (result.response.statusCode == HttpStatus.ok) {
        final data = result.response.data as Map<String, dynamic>;
        return Success(BreakingNewsModel.fromJson(data).articles);
      } else {
        return Error(
          DioError(
            requestOptions: result.response.requestOptions,
            error: result.response.statusMessage,
            response: result.response,
            type: DioErrorType.response,
          ),
        );
      }
    } on DioError catch (e) {
      return Error(e);
    }
  }
}
