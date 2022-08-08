import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/article.dart';
import 'source_model.dart';
part 'article_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleModel extends Article {
  final SourceModel source;

  const ArticleModel({
    required this.source,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
    super.author,
  }) : super(source: source);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
