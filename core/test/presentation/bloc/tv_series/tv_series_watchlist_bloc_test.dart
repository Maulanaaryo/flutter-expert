import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/save_watchlist_tv_series.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_watchlist/tv_series_watchlist_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects_tv.dart';
import 'tv_series_watchlist_bloc_test.mocks.dart';

@GenerateMocks([
  TvSeriesWatchlistBloc,
  GetWatchlistTvSeries,
  GetWatchListStatusTvSeries,
  RemoveWatchlistTvSeries,
  SaveWatchlistTvSeries
])
void main() {
  late MockGetWatchlistTvSeries mockGetWatchlistTv;
  late MockGetWatchListStatusTvSeries mockGetWatchListStatus;
  late MockSaveWatchlistTvSeries mockSaveWatchlist;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlist;
  late TvSeriesWatchlistBloc tvWatchlistBloc;

  setUp(() {
    mockGetWatchlistTv = MockGetWatchlistTvSeries();
    mockGetWatchListStatus = MockGetWatchListStatusTvSeries();
    mockSaveWatchlist = MockSaveWatchlistTvSeries();
    mockRemoveWatchlist = MockRemoveWatchlistTvSeries();
    tvWatchlistBloc = TvSeriesWatchlistBloc(
      getWatchlistTv: mockGetWatchlistTv,
      getWatchListStatus: mockGetWatchListStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tvId = 1;

  test("initial state should be empty", () {
    expect(tvWatchlistBloc.state, TvWatchlistEmpty());
  });

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => Right([testWatchlistTv]));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(GetListEvent()),
    expect: () => [
      TvWatchlistLoading(),
      TvWatchlistLoaded([testWatchlistTv])
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTv.execute());
    },
  );

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure("Can't get data")));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(GetListEvent()),
    expect: () =>
        [TvWatchlistLoading(), const TvWatchlistError("Can't get data")],
    verify: (bloc) {
      verify(mockGetWatchlistTv.execute());
    },
  );

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [Loaded] when get status tv watchlist is successful',
    build: () {
      when(mockGetWatchListStatus.execute(tvId)).thenAnswer((_) async => true);
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(const GetStatusTvEvent(tvId)),
    expect: () => [const TvWatchlistStatusLoaded(true)],
    verify: (bloc) {
      verify(mockGetWatchListStatus.execute(tvId));
    },
  );

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [success] when add tv item to watchlist is successful',
    build: () {
      when(mockSaveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Right("Success"));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(const AddItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistSuccess("Success")],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [success] when remove tv item to watchlist is successful',
    build: () {
      when(mockRemoveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Right("Removed"));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(const RemoveItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistSuccess("Removed")],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [error] when add tv item to watchlist is unsuccessful',
    build: () {
      when(mockSaveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(const AddItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistError("Failed")],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
    'Should emit [error] when remove tv item to watchlist is unsuccessful',
    build: () {
      when(mockRemoveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(const RemoveItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistError("Failed")],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testTvDetail));
    },
  );
}
