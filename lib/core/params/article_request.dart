import 'package:clean_architecture/core/utils/constants.dart';

class ArticleRequestParams {
  final String apiKey;
  final String country;
  final String category;
  final int pageSize;
  final int page;

  const ArticleRequestParams({
    this.apiKey = kApiKey,
    this.country = 'us',
    this.category = "general",
    this.pageSize = 20,
    this.page = 1,
  });
}
