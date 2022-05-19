import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_popular/tv_series_popular_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_popular_bloc_test.mocks.dart';

@GenerateMocks([TvSeriesPopularBloc, GetPopularTvSeries])
void main() {
  late MockGetPopularTvSeries mockGetPopularTv;
  late TvSeriesPopularBloc tvPopularBloc;

  setUp(() {
    mockGetPopularTv = MockGetPopularTvSeries();
    tvPopularBloc = TvSeriesPopularBloc(mockGetPopularTv);
  });

  final tvList = <TvSeries>[];

  test("initial state should be empty", () {
    expect(tvPopularBloc.state, TvPopularEmpty());
  });

  group(
    'Popular Tv BLoC Test',
    () {
      blocTest<TvSeriesPopularBloc, TvSeriesPopularState>(
        'Should emit [Loading, Loaded] when data is gotten successfully',
        build: () {
          when(mockGetPopularTv.execute())
              .thenAnswer((_) async => Right(tvList));
          return tvPopularBloc;
        },
        act: (bloc) => bloc.add(TvPopularGetEvent()),
        expect: () => [TvPopularLoading(), TvPopularLoaded(tvList)],
        verify: (bloc) {
          verify(mockGetPopularTv.execute());
        },
      );

      blocTest<TvSeriesPopularBloc, TvSeriesPopularState>(
        'Should emit [Loading, Error] when get popular is unsuccessful',
        build: () {
          when(mockGetPopularTv.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return tvPopularBloc;
        },
        act: (bloc) => bloc.add(TvPopularGetEvent()),
        expect: () =>
            [TvPopularLoading(), const TvPopularError('Server Failure')],
        verify: (bloc) {
          verify(mockGetPopularTv.execute());
        },
      );
    },
  );
}
