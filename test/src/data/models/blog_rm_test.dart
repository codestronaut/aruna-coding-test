import 'package:aruna_coding_test/src/data/data.dart';
import 'package:aruna_coding_test/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tBlogRM = BlogRM(
    userId: 1,
    id: 1,
    title: 'Blog Title',
    content: 'Blog Content',
  );

  const tBlog = Blog(
    userId: 1,
    id: 1,
    title: 'Blog Title',
    content: 'Blog Content',
  );

  group('to domain model', () {
    test(
      'should map blog remote model to blog domain model',
      () {
        final result = tBlogRM.toDomainModel();
        expect(result, equals(tBlog));
      },
    );
  });
}
