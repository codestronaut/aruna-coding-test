import 'dart:convert';

import 'package:aruna_coding_test/src/data/data_sources/blog_remote_ds.dart';
import 'package:aruna_coding_test/src/data/models/article_rm.dart';
import 'package:aruna_coding_test/src/utils/exceptions.dart';
import 'package:aruna_coding_test/src/utils/urls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../json_reader.dart';
import '../../../mock_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late BlogRemoteDS dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = BlogRemoteDS(client: mockHttpClient);
  });

  group('get blog articles', () {
    final tArticlesJson = json.decode(readJson('dummy.json'));
    final tArticlesRM = List<ArticleRM>.from(
      (tArticlesJson as List).map(
        (item) => ArticleRM.fromJson(item),
      ),
    );

    test(
      'should return blog articles when successful',
      () async {
        when(mockHttpClient.get(Uri.parse(Urls.posts))).thenAnswer(
          (_) async => http.Response(readJson('dummy.json'), 200),
        );

        final result = await dataSource.getArticles();
        expect(result, equals(tArticlesRM));
      },
    );

    test(
      'should throw a server exception when failed',
      () async {
        when(mockHttpClient.get(Uri.parse(Urls.posts))).thenAnswer(
          (_) async => http.Response('Not found', 404),
        );

        final call = dataSource.getArticles();
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });
}
