import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/data.dart';
import '../../domain/models/article.dart';
import '../../utils/states.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository repository;
  BlogBloc(this.repository) : super(const BlogState()) {
    on<LoadBlog>(onLoadBlog);
    on<ToggleSearching>(onToggleSearching);
    on<SearchBlogByTitle>(onSearchBlogByTitle);
  }

  Future onLoadBlog(
    LoadBlog event,
    Emitter<BlogState> emit,
  ) async {
    try {
      emit(state.copyWith(state: AppState.loading));
      final data = await repository.getArticles();
      emit(state.copyWith(
        state: AppState.loaded,
        data: data,
      ));
    } catch (_) {
      emit(state.copyWith(state: AppState.failure));
    }
  }

  onToggleSearching(
    ToggleSearching event,
    Emitter<BlogState> emit,
  ) {
    emit(state.copyWith(
      isSearching: event.state,
      searchResult: [],
    ));
  }

  onSearchBlogByTitle(
    SearchBlogByTitle event,
    Emitter<BlogState> emit,
  ) {
    final relatedData = List<Article>.from(state.data)
        .where((item) => item.title.contains(event.query))
        .toList();
    emit(state.copyWith(searchResult: relatedData));
  }
}
