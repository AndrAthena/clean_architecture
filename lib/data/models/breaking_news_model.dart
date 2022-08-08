import 'package:json_annotation/json_annotation.dart';
import 'article_model.dart';
part 'breaking_news_model.g.dart';

@JsonSerializable()
class BreakingNewsModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  BreakingNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) =>
      _$BreakingNewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreakingNewsModelToJson(this);
}
