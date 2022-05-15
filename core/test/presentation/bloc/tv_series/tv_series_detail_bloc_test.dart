import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/usecases/tv_series/get_detail_tv_series.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_detail/tv_series_detail_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects_tv.dart';
import 'tv_series_detail_bloc_test.mocks.dart';

@GenerateMocks([TvSeriesDetailBloc, GetDetailTvSeries])
void main() {
  late MockGetDetailTvSeries mockGetTvDetail;
  late TvSeriesDetailBloc tvDetailBloc;
  setUp(() {
    mockGetTvDetail = MockGetDetailTvSeries();
    tvDetailBloc = TvSeriesDetailBloc(getTvDetail: mockGetTvDetail);
  });

  const tvId = 1;

  test("initial state should be empty", () {
    expect(tvDetailBloc.state, TvDetailEmpty());
  });

  group(
    'Top Rated Movies BLoC Test',
    () {
      blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
        'Should emit [Loading, Loaded] when data is gotten successfully',
        build: () {
          when(mockGetTvDetail.execute(tvId))
              .thenAnswer((_) async => const Right(testTvDetail));
          return tvDetailBloc;
        },
        act: (bloc) => bloc.add(const GetTvDetailEvent(tvId)),
        expect: () => [TvDetailLoading(), const TvDetailLoaded(testTvDetail)],
        verify: (bloc) {
          verify(mockGetTvDetail.execute(tvId));
        },
      );

      blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
        'Should emit [Loading, Error] when get detail is unsuccessful',
        build: () {
          when(mockGetTvDetail.execute(tvId)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return tvDetailBloc;
        },
        act: (bloc) => bloc.add(const GetTvDetailEvent(tvId)),
        expect: () =>
            [TvDetailLoading(), const TvDetailError('Server Failure')],
        verify: (bloc) {
          verify(mockGetTvDetail.execute(tvId));
        },
      );
    },
  );
}
