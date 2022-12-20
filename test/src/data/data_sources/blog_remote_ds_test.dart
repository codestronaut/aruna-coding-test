import 'dart:convert';

import 'package:aruna_coding_test/src/data/data_sources/blog_remote_ds.dart';
import 'package:aruna_coding_test/src/data/models/blog_rm.dart';
import 'package:aruna_coding_test/src/utils/urls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../json_reader.dart';
import '../../../mock_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late BlogRemoteDS dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = BlogRemoteDS(client: mockHttpClient);
  });

  group('get blog posts', () {
    final tBlogJson = json.decode(readJson('dummy.json'));
    final tBlogListRM = List<BlogRM>.from(
      (tBlogJson as List).map(
        (item) => BlogRM.fromJson(item),
      ),
    );

    test(
      'should return blog posts when successful',
      () async {
        when(mockHttpClient.get(Uri.parse(Urls.posts))).thenAnswer(
          (_) async => http.Response(readJson('dummy.json'), 200),
        );

        final result = await dataSource.getPosts();
        expect(result, equals(tBlogListRM));
      },
    );
  });
}
