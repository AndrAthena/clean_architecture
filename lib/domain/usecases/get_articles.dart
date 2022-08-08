import '../../core/params/article_request.dart';
import '../../core/resources/result.dart';
import '../../core/usecases/usecase.dart';
import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class GetArticlesUseCase<E>
    implements UseCase<E, List<Article>, ArticleRequestParams> {
  final ArticlesRepository<E> repository;

  GetArticlesUseCase(this.repository);

  @override
  Future<Result<E, List<Article>>> call(ArticleRequestParams? input) async {
    return await repository.getBreakingNewsArticles(input!);
  }
}
