import 'package:aruna_coding_test/src/data/data.dart';
import 'package:aruna_coding_test/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tArticleRM = ArticleRM(
    userId: 1,
    id: 1,
    title: 'Title',
    content: 'Content',
  );

  const tArticle = Article(
    userId: 1,
    id: 1,
    title: 'Title',
    content: 'Content',
  );

  group('to domain model', () {
    test(
      'should map article remote model to article domain model',
      () {
        final mappedModel = tArticleRM.toDomainModel();
        expect(mappedModel, equals(tArticle));
      },
    );
  });
}
