import 'package:clean_architecture/domain/repositories/articles_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/article_repository_impl.dart';
import 'domain/usecases/get_articles.dart';
import 'presentation/blocs/article/article_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt()));

  getIt.registerSingleton<ArticlesRepository<DioError>>(ArticleRepositoryImpl(
    getIt(),
  ));

  getIt.registerSingleton<GetArticlesUseCase<DioError>>(GetArticlesUseCase(
    getIt(),
  ));

  getIt.registerFactory<ArticleBloc>(() => ArticleBloc(getIt()));
}
