import 'package:aruna_coding_test/src/data/models/blog_rm.dart';
import 'package:aruna_coding_test/src/domain/models/blog.dart';

extension BlogRMtoDomain on BlogRM {
  Blog toDomainModel() {
    return Blog(
      userId: userId,
      id: id,
      title: title,
      content: content,
    );
  }
}
