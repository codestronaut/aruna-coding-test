import '../../domain/models/blog.dart';
import '../models/blog_rm.dart';

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
