import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_rm.g.dart';

@JsonSerializable(createToJson: false)
class ArticleRM extends Equatable {
  @JsonKey(name: 'userId')
  final int userId;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'body')
  final String content;

  const ArticleRM({
    required this.userId,
    required this.id,
    required this.title,
    required this.content,
  });

  factory ArticleRM.fromJson(Map<String, dynamic> json) =>
      _$ArticleRMFromJson(json);

  @override
  List<Object?> get props => [userId, id, title, content];
}
