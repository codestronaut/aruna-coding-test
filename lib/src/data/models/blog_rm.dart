import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_rm.g.dart';

@JsonSerializable(createToJson: false)
class BlogRM extends Equatable {
  @JsonKey(name: 'userId')
  final int userId;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'body')
  final String content;

  const BlogRM({
    required this.userId,
    required this.id,
    required this.title,
    required this.content,
  });

  factory BlogRM.fromJson(Map<String, dynamic> json) => _$BlogRMFromJson(json);

  @override
  List<Object?> get props => [userId, id, title, content];
}
