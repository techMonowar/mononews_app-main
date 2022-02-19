import 'package:dartz/dartz.dart';
import 'package:mononews_app/common/failure.dart';
import 'package:mononews_app/domain/entities/article.dart';
import 'package:mononews_app/domain/repositories/article_repository.dart';

class GetHeadlineBusinessArticles {
  final ArticleRepository repository;

  GetHeadlineBusinessArticles(this.repository);

  Future<Either<Failure, List<Article>>> execute() {
    return repository.getHeadlineBusinessArticles();
  }
}
