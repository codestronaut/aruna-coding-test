import 'package:aruna_coding_test/src/data/data.dart';
import 'package:aruna_coding_test/src/domain/domain.dart';
import 'package:flutter/material.dart';

class BlogRepository {
  BlogRepository({
    @visibleForTesting BlogRemoteDS? remoteDS,
  }) : remoteDS = remoteDS ?? BlogRemoteDS();

  final BlogRemoteDS remoteDS;

  Future<List<Blog>> getPosts() async {
    final blogPosts = await remoteDS.getPosts();
    return blogPosts.map((item) => item.toDomainModel()).toList();
  }
}
