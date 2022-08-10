import '../../core/params/article_request.dart';
import '../../core/resources/result.dart';
import '../../core/usecases/usecase.dart';
import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class GetArticlesUseCase<E>
    implements UseCase<E, List<Article>, ArticleRequestParams> {
  final ArticlesRepository<E> _repository;

  GetArticlesUseCase(this._repository);

  @override
  Future<Result<E, List<Article>>> call(ArticleRequestParams? input) async {
    return await _repository.getBreakingNewsArticles(input!);
  }
}
