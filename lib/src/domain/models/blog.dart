import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String content;

  const Blog({
    required this.userId,
    required this.id,
    required this.title,
    required this.content,
  });

  static const empty = Blog(userId: 1, id: 1, title: '', content: '');
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [userId, id, title, content];
}
