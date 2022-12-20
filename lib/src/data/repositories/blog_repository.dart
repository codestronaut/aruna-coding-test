import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../data.dart';

class BlogRepository {
  BlogRepository({
    @visibleForTesting BlogRemoteDS? remoteDS,
  }) : remoteDS = remoteDS ?? BlogRemoteDS();

  final BlogRemoteDS remoteDS;

  Future<List<Article>> getArticles() async {
    final blogPosts = await remoteDS.getArticles();
    return blogPosts.map((item) => item.toDomainModel()).toList();
  }
}
