import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String content;

  const Article({
    required this.userId,
    required this.id,
    required this.title,
    required this.content,
  });

  static const empty = Article(userId: 1, id: 1, title: '', content: '');
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [userId, id, title, content];
}
