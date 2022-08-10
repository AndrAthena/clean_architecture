import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../core/utils/constants.dart';
import '../../models/breaking_news_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: kBaseApiUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  @Headers(<String, dynamic>{"Authorization": kApiKey})
  Future<HttpResponse<BreakingNewsModel>> getBreakingNewsArticle({
    @Query('country') required String country,
    @Query('category') required String category,
    @Query('pageSize') required int pageSize,
    @Query('page') required int page,
  });
}
