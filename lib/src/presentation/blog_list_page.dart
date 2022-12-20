import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data.dart';
import '../utils/states.dart';
import 'bloc/blog_bloc.dart';
import 'widgets/article_card.dart';
import 'widgets/empty_placeholders.dart';

class BlogListPage extends StatelessWidget {
  BlogListPage({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogBloc(
        context.read<BlogRepository>(),
      )..add(const LoadBlog()),
      child: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: state.isSearching
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        autofocus: true,
                        controller: searchController,
                        onChanged: (query) {
                          context
                              .read<BlogBloc>()
                              .add(SearchBlogByTitle(query));
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search article by title',
                        ),
                      ),
                    )
                  : const Text(
                      'Articles',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              elevation: 0.0,
              shape: Border(
                bottom: BorderSide(
                  color: Colors.grey[200]!,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () {
                      final bloc = context.read<BlogBloc>();
                      if (state.isSearching) {
                        bloc.add(const ToggleSearching(false));
                      } else {
                        bloc.add(const ToggleSearching(true));
                      }
                    },
                    icon: Icon(state.isSearching ? Icons.close : Icons.search),
                    splashRadius: 20.0,
                  ),
                ),
              ],
            ),
            body: _Content(isQueryEmpty: searchController.text.isEmpty),
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key, this.isQueryEmpty = true}) : super(key: key);
  final bool isQueryEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        switch (state.state) {
          case AppState.initial:
          case AppState.loading:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey[900],
              ),
            );
          case AppState.loaded:
            var articles = [];
            if (state.isSearching) {
              articles = state.searchResult;
            } else {
              articles = state.data;
            }

            if (articles.isEmpty) {
              return SearchPlaceholder(isQueryEmpty: isQueryEmpty);
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleCard(article: article);
                },
                separatorBuilder: (_, __) {
                  return const Divider();
                },
                itemCount: articles.length,
              );
            }
          case AppState.failure:
            return LoadFailurePlaceholder(
              onRefresh: () {
                context.read<BlogBloc>().add(const LoadBlog());
              },
            );
        }
      },
    );
  }
}
