import 'package:core/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:core/utils/exception.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_tv_series_helper.mocks.dart';


void main() {
  late TvSeriesLocalDataSourceImpl dataSourcetv;
  late MockDatabaseHelperTv mockDatabaseHelperTv;

  setUp(() {
    mockDatabaseHelperTv = MockDatabaseHelperTv();
    dataSourcetv = TvSeriesLocalDataSourceImpl(databaseHelpertv: mockDatabaseHelperTv);
  });

  group('save watchlist tv', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTv.insertWatchlistTv(testTvTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSourcetv.insertWatchlistTv(testTvTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert tv to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTv.insertWatchlistTv(testTvTable))
          .thenThrow(Exception());
      // act
      final call = dataSourcetv.insertWatchlistTv(testTvTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist tv', () {

    test('should throw DatabaseException when remove tv from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTv.removeWatchlistTv(testTvTable))
          .thenThrow(Exception());
      // act
      final call = dataSourcetv.removeWatchlistTv(testTvTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Detail By Id', () {
    const tId = 1;

    test('should return Tv Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTv.getTvById(tId))
          .thenAnswer((_) async => testTvMap);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, testTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTv.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv', () {
    test('should return list of TvTable from database', () async {
      // arrange
      when(mockDatabaseHelperTv.getWatchlistTv())
          .thenAnswer((_) async => [testTvMap]);
      // act
      final result = await dataSourcetv.getWatchlistTv();
      // assert
      expect(result, [testTvTable]);
    });
  });
}
