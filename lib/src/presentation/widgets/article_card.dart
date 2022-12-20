import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../blog_detail_page.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlogDetailPage(
              article: article,
            ),
          ),
        );
      },
      title: Text(article.title),
      leading: const Icon(Icons.article_outlined),
      trailing: const Icon(Icons.chevron_right),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
