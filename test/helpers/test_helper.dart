import 'package:mononews_app/common/network_info.dart';
import 'package:mononews_app/data/datasources/article_local_data_source.dart';
import 'package:mononews_app/data/datasources/article_remote_data_source.dart';
import 'package:mononews_app/data/datasources/db/database_helper.dart';
import 'package:mononews_app/domain/repositories/article_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  ArticleRepository,
  ArticleRemoteDataSource,
  ArticleLocalDataSource,
  NetworkInfo,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
