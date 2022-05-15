import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/presentation/bloc/movie/movie_detail/movie_detail_bloc.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([MovieDetailBloc, GetMovieDetail])
void main() {
  late MockGetMovieDetail mockGetMovieDetail;
  late MovieDetailBloc movieDetailBloc;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    movieDetailBloc = MovieDetailBloc(getMovieDetail: mockGetMovieDetail);
  });

  const movieId = 1;

  test("initial state should be empty", () {
    expect(movieDetailBloc.state, DetailMovieEmpty());
  });

  group('Detail Movies BLoC Test', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetMovieDetail.execute(movieId))
            .thenAnswer((_) async => const Right(testMovieDetail));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const GetMovieDetailEvent(movieId)),
      expect: () =>
          [DetailMovieLoading(), const DetailMovieLoaded(testMovieDetail)],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(movieId));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Should emit [Loading, Error] when get detail is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(movieId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const GetMovieDetailEvent(movieId)),
      expect: () =>
          [DetailMovieLoading(), const DetailMovieError('Server Failure')],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(movieId));
      },
    );
  });
}
