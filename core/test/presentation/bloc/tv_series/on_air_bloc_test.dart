import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_on_air/tv_series_on_air_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'on_air_bloc_test.mocks.dart';

@GenerateMocks([TvSeriesOnAirBloc, GetNowPlayingTvSeries])
void main() {
  late MockGetNowPlayingTvSeries mockGetNowPlayingTv;
  late TvSeriesOnAirBloc tvOnAirBloc;

  setUp(() {
    mockGetNowPlayingTv = MockGetNowPlayingTvSeries();
    tvOnAirBloc = TvSeriesOnAirBloc(mockGetNowPlayingTv);
  });

  final tvList = <TvSeries>[];

  test("initial state should be empty", () {
    expect(tvOnAirBloc.state, TvOnAirEmpty());
  });

  group(
    'On Air Tv BLoC Test',
    () {
      blocTest<TvSeriesOnAirBloc, TvSeriesOnAirState>(
        'Should emit [Loading, Loaded] when data is gotten successfully',
        build: () {
          when(mockGetNowPlayingTv.execute())
              .thenAnswer((_) async => Right(tvList));
          return tvOnAirBloc;
        },
        act: (bloc) => bloc.add(TvOnAirGetEvent()),
        expect: () => [TvOnAirLoading(), TvOnAirLoaded(tvList)],
        verify: (bloc) {
          verify(mockGetNowPlayingTv.execute());
        },
      );

      blocTest<TvSeriesOnAirBloc, TvSeriesOnAirState>(
        'Should emit [Loading, Error] when get now playing is unsuccessful',
        build: () {
          when(mockGetNowPlayingTv.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return tvOnAirBloc;
        },
        act: (bloc) => bloc.add(TvOnAirGetEvent()),
        expect: () => [TvOnAirLoading(), const TvOnAirError('Server Failure')],
        verify: (bloc) {
          verify(mockGetNowPlayingTv.execute());
        },
      );
    },
  );
}
