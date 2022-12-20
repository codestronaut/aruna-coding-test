import 'package:aruna_coding_test/src/data/data.dart';
import 'package:aruna_coding_test/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mock_helper.mocks.dart';

void main() {
  late MockBlogRemoteDS mockDataSource;
  late BlogRepository repository;

  setUp(() {
    mockDataSource = MockBlogRemoteDS();
    repository = BlogRepository(
      remoteDS: mockDataSource,
    );
  });

  group('get blog articles', () {
    final tBlogArticlesRM = [
      const ArticleRM(
        userId: 1,
        id: 1,
        title: 'Blog Title 1',
        content: 'Blog Content',
      ),
    ];

    final tBlogArticles = [
      const Article(
        userId: 1,
        id: 1,
        title: 'Blog Title 1',
        content: 'Blog Content',
      ),
    ];

    test(
      'should return blog articles when a call to data source is successful',
      () async {
        when(mockDataSource.getArticles())
            .thenAnswer((_) async => tBlogArticlesRM);

        final result = await repository.getArticles();
        verify(mockDataSource.getArticles());
        expect(result, equals(tBlogArticles));
      },
    );
  });
}
