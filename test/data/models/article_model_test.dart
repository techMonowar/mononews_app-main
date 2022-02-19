import 'package:flutter_test/flutter_test.dart';
import 'package:mononews_app/data/models/article_model.dart';
import 'package:mononews_app/domain/entities/article.dart';

void main() {
  final tArticleModel = ArticleModel(
    author: 'author',
    title: 'title',
    description: 'description',
    url: 'url',
    urlToImage: 'urlToImage',
    publishedAt: DateTime.parse('2020-01-01T12:00:00.000Z'),
    content: 'content',
  );

  final tArticle = Article(
    author: 'author',
    title: 'title',
    description: 'description',
    url: 'url',
    urlToImage: 'urlToImage',
    publishedAt: DateTime.parse('2020-01-01T12:00:00.000Z'),
    content: 'content',
  );

  test('should be a subclass of Article entity', () async {
    final result = tArticleModel.toEntity();
    expect(result, tArticle);
  });
}
