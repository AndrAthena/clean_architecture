class ArticleRequestParams {
  final String country;
  final String category;
  final int pageSize;
  final int page;

  const ArticleRequestParams({
    this.country = 'us',
    this.category = "general",
    this.pageSize = 20,
    this.page = 1,
  });
}
