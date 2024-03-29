import 'package:core/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects_tv.dart';
import '../../../helpers/test_tv_series_helper.mocks.dart';


void main() {
  late GetWatchlistTvSeries usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetWatchlistTvSeries(mockTvRepository);
  });

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.getWatchlistTvSeries())
        .thenAnswer((_) async => Right(testTvList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTvList));
  });
}
