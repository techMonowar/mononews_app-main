import 'package:dartz/dartz.dart';
import 'package:mononews_app/common/failure.dart';
import 'package:mononews_app/domain/entities/article.dart';
import 'package:mononews_app/domain/repositories/article_repository.dart';

class SaveBookmarkArticle {
  final ArticleRepository repository;

  SaveBookmarkArticle(this.repository);

  Future<Either<Failure, String>> execute(Article article) {
    return repository.saveBookmarkArticle(article);
  }
}
