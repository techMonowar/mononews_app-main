import 'package:mononews_app/data/models/article_table.dart';
import 'package:mononews_app/domain/entities/article.dart';

final testArticle = Article(
  author: 'test author',
  title: 'test title',
  description: 'test description',
  url: 'test url',
  urlToImage: 'test url to image',
  publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
  content: 'test content',
);

final testArticleList = [testArticle];

final testArticleCache = ArticleTable(
  author: 'test author',
  title: 'test title',
  description: 'test description',
  url: 'test url',
  urlToImage: 'test url to image',
  publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
  content: 'test content',
);

final testArticleCacheMap = {
  'author': 'test author',
  'title': 'test title',
  'description': 'test description',
  'url': 'test url',
  'urlToImage': 'test url to image',
  'publishedAt': '2022-01-01T02:15:39Z',
  'content': 'test content',
};

final testArticleFromCache = Article.bookmark(
  author: 'test author',
  title: 'test title',
  description: 'test description',
  url: 'test url',
  urlToImage: 'test url to image',
  publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
  content: 'test content',
);

final testBookmarkArticle = Article.bookmark(
  author: 'test author',
  title: 'test title',
  description: 'test description',
  url: 'test url',
  urlToImage: 'test url to image',
  publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
  content: 'test content',
);

final testArticleTable = ArticleTable(
  author: 'test author',
  title: 'test title',
  description: 'test description',
  url: 'test url',
  urlToImage: 'test url to image',
  publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
  content: 'test content',
);

final testArticleMap = {
  'author': 'test author',
  'title': 'test title',
  'description': 'test description',
  'url': 'test url',
  'urlToImage': 'test url to image',
  'publishedAt': '2022-01-01T02:15:39Z',
  'content': 'test content',
};
