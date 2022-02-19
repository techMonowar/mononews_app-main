import 'package:dartz/dartz.dart';
import 'package:mononews_app/common/failure.dart';
import 'package:mononews_app/domain/entities/articles.dart';
import 'package:mononews_app/domain/repositories/article_repository.dart';

class SearchArticles {
  final ArticleRepository repository;

  SearchArticles(this.repository);

  Future<Either<Failure, Articles>> execute(String query, {int page: 1}) {
    return repository.searchArticles(query, page: page);
  }
}
