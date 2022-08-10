import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/article.dart';
import 'source_model.dart';
part 'article_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleModel extends Article {
  @override
  final SourceModel source;

  const ArticleModel({
    required this.source,
    required super.title,
    required super.url,
    required super.publishedAt,
    super.description,
    super.urlToImage,
    super.content,
    super.author,
  }) : super(source: source);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
