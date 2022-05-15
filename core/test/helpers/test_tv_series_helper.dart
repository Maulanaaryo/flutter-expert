import 'package:core/datasources/db/database_helper_tv.dart';
import 'package:core/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:core/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  TvRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelperTv,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}