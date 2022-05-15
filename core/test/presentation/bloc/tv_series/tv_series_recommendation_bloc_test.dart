import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_recommendations_tv_series.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_recommendation/tv_series_recommendation_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_recommendation_bloc_test.mocks.dart';

@GenerateMocks([TvSeriesRecommendationBloc, GetRecommendationsTvSeries])
void main() {
  late MockGetRecommendationsTvSeries mockGetTvRecommendation;
  late TvSeriesRecommendationBloc tvRecommendationBloc;

  setUp(() {
    mockGetTvRecommendation = MockGetRecommendationsTvSeries();
    tvRecommendationBloc = TvSeriesRecommendationBloc(
      getTvRecommendations: mockGetTvRecommendation,
    );
  });

  test("initial state should be empty", () {
    expect(tvRecommendationBloc.state, TvRecommendationEmpty());
  });

  const tvId = 1;
  final tvList = <TvSeries>[];

  blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetTvRecommendation.execute(tvId))
          .thenAnswer((_) async => Right(tvList));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(const GetTvRecommendationEvent(tvId)),
    expect: () => [TvRecommendationLoading(), TvRecommendationLoaded(tvList)],
    verify: (bloc) {
      verify(mockGetTvRecommendation.execute(tvId));
    },
  );

  group(
    'Recommendation Tv BLoC Test',
    () {
      blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
        'Should emit [Loading, Error] when get recommendation is unsuccessful',
        build: () {
          when(mockGetTvRecommendation.execute(tvId)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return tvRecommendationBloc;
        },
        act: (bloc) => bloc.add(const GetTvRecommendationEvent(tvId)),
        expect: () => [
          TvRecommendationLoading(),
          const TvRecommendationError('Server Failure')
        ],
        verify: (bloc) {
          verify(mockGetTvRecommendation.execute(tvId));
        },
      );
    },
  );
}
