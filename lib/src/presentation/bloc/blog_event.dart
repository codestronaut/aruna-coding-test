part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();
}

class LoadBlog extends BlogEvent {
  const LoadBlog();

  @override
  List<Object?> get props => [];
}

class ToggleSearching extends BlogEvent {
  const ToggleSearching(this.state);
  final bool state;

  @override
  List<Object?> get props => [state];
}

class SearchBlogByTitle extends BlogEvent {
  final String query;
  const SearchBlogByTitle(this.query);

  @override
  List<Object?> get props => [query];
}
