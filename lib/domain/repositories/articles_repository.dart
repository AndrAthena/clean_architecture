import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/resources/result.dart';
import 'package:clean_architecture/domain/entities/article.dart';

abstract class ArticlesRepository<E> {
  Future<Result<E, List<Article>>> getBreakingNewsArticles(
    ArticleRequestParams params,
  );
}
