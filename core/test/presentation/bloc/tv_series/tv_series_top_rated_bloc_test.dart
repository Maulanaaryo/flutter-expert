import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_top_rated/tv_series_top_rated_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_top_rated_bloc_test.mocks.dart';

@GenerateMocks([TvSeriesTopRatedBloc, GetTopRatedTvSeries])
void main() {
  late MockGetTopRatedTvSeries mockGetTopRatedTv;
  late TvSeriesTopRatedBloc tvTopRatedBloc;

  setUp(() {
    mockGetTopRatedTv = MockGetTopRatedTvSeries();
    tvTopRatedBloc = TvSeriesTopRatedBloc(mockGetTopRatedTv);
  });

  final tvList = <TvSeries>[];

  test("initial state should be empty", () {
    expect(tvTopRatedBloc.state, TvTopRatedEmpty());
  });

  group(
    'Top Rated Movies BLoC Test',
    () {
      blocTest<TvSeriesTopRatedBloc, TvSeriesTopRatedState>(
        'Should emit [Loading, Loaded] when data is gotten successfully',
        build: () {
          when(mockGetTopRatedTv.execute())
              .thenAnswer((_) async => Right(tvList));
          return tvTopRatedBloc;
        },
        act: (bloc) => bloc.add(TvTopRatedGetEvent()),
        expect: () => [TvTopRatedLoading(), TvTopRatedLoaded(tvList)],
        verify: (bloc) {
          verify(mockGetTopRatedTv.execute());
        },
      );

      blocTest<TvSeriesTopRatedBloc, TvSeriesTopRatedState>(
        'Should emit [Loading, Error] when get top rated is unsuccessful',
        build: () {
          when(mockGetTopRatedTv.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return tvTopRatedBloc;
        },
        act: (bloc) => bloc.add(TvTopRatedGetEvent()),
        expect: () =>
            [TvTopRatedLoading(), const TvTopRatedError('Server Failure')],
        verify: (bloc) {
          verify(mockGetTopRatedTv.execute());
        },
      );
    },
  );
}
