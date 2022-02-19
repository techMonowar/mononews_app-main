import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mononews_app/common/failure.dart';
import 'package:mononews_app/domain/entities/article.dart';
import 'package:mononews_app/domain/entities/articles.dart';
import 'package:mononews_app/domain/usecases/search_articles.dart';
import 'package:mononews_app/presentation/bloc/search_article_bloc/search_article_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_article_bloc_test.mocks.dart';

@GenerateMocks([SearchArticles])
void main() {
  late SearchArticleBloc searchArticleBloc;
  late MockSearchArticles mockSearchArticles;

  setUp(() {
    mockSearchArticles = MockSearchArticles();
    searchArticleBloc = SearchArticleBloc(mockSearchArticles);
  });

  final tArticleModel = Article(
    author: 'test author',
    title: 'test title',
    description: 'test description',
    url: 'test url',
    urlToImage: 'test url to image',
    publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
    content: 'test content',
  );

  final tArticles = Articles(
    totalResults: 1,
    articles: [tArticleModel],
  );

  final tArticleList = <Article>[tArticleModel];
  final tQuery = 'business';
  final totalResults = 1;
  final tPage = 1;

  group('Search Articles', () {
    test('Initial state should be empty', () {
      expect(searchArticleBloc.state, SearchArticleInitial());
    });

    blocTest<SearchArticleBloc, SearchArticleState>(
      'Should emit [SearchLoading, SearchHasData] when data is gotten successfully',
      build: () {
        when(mockSearchArticles.execute(tQuery))
            .thenAnswer((_) async => Right(tArticles));
        return searchArticleBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchArticleLoading(),
        SearchArticleHasData(tArticleList, totalResults, tPage),
      ],
      verify: (bloc) {
        verify(mockSearchArticles.execute(tQuery));
      },
    );

    blocTest<SearchArticleBloc, SearchArticleState>(
      'Should emit [SearchLoading, SearchHasData[], SearchEmpty] when data is empty',
      build: () {
        when(mockSearchArticles.execute(tQuery)).thenAnswer(
            (_) async => Right(Articles(totalResults: 1, articles: [])));
        return searchArticleBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchArticleLoading(),
        SearchArticleHasData(<Article>[], totalResults, tPage),
        SearchArticleEmpty('No Result Found'),
      ],
      verify: (bloc) {
        verify(mockSearchArticles.execute(tQuery));
      },
    );

    blocTest<SearchArticleBloc, SearchArticleState>(
      'Should emit [SearchLoading, SearchError] when data is unsuccessful',
      build: () {
        when(mockSearchArticles.execute(tQuery))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return searchArticleBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchArticleLoading(),
        SearchArticleError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchArticles.execute(tQuery));
      },
    );
  });
}
