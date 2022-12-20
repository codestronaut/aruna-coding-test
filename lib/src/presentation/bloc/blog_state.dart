part of 'blog_bloc.dart';

class BlogState extends Equatable {
  const BlogState({
    this.state = AppState.initial,
    List<Article>? data,
    bool? isSearching,
    List<Article>? searchResult,
  })  : data = data ?? const <Article>[],
        isSearching = isSearching ?? false,
        searchResult = searchResult ?? const <Article>[];

  final AppState state;
  final List<Article> data;
  final bool isSearching;
  final List<Article> searchResult;

  @override
  List<Object> get props => [
        state,
        data,
        isSearching,
        searchResult,
      ];

  BlogState copyWith({
    AppState? state,
    List<Article>? data,
    bool? isSearching,
    List<Article>? searchResult,
  }) {
    return BlogState(
      state: state ?? this.state,
      data: data ?? this.data,
      isSearching: isSearching ?? this.isSearching,
      searchResult: searchResult ?? this.searchResult,
    );
  }
}
