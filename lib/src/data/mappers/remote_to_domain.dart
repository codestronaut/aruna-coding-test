import '../../domain/models/article.dart';
import '../models/article_rm.dart';

extension ArticleRMtoDomain on ArticleRM {
  Article toDomainModel() {
    return Article(
      userId: userId,
      id: id,
      title: title,
      content: content,
    );
  }
}
