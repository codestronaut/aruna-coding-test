import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/exceptions.dart';
import '../../utils/urls.dart';
import '../models/blog_rm.dart';

class BlogRemoteDS {
  BlogRemoteDS({
    @visibleForTesting Client? client,
  }) : client = client ?? http.Client();

  final Client client;

  Future<List<BlogRM>> getPosts() async {
    try {
      final response = await client.get(Uri.parse(Urls.posts));
      return List<BlogRM>.from(
        (json.decode(response.body) as List).map(
          (item) => BlogRM.fromJson(item),
        ),
      );
    } catch (error) {
      if (kDebugMode) print(error);
      throw ServerException();
    }
  }
}
