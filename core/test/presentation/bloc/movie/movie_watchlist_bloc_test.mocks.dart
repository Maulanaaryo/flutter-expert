// Mocks generated by Mockito 5.1.0 from annotations
// in core/test/presentation/bloc/movie/movie_watchlist_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:core/domain/entities/movie/movie.dart' as _i12;
import 'package:core/domain/entities/movie/movie_detail.dart' as _i13;
import 'package:core/domain/repositories/movie_repository.dart' as _i8;
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart' as _i2;
import 'package:core/domain/usecases/movie/get_watchlist_status.dart' as _i3;
import 'package:core/domain/usecases/movie/remove_watchlist.dart' as _i5;
import 'package:core/domain/usecases/movie/save_watchlist.dart' as _i4;
import 'package:core/presentation/bloc/movie/movie_watchlist/movie_watchlist_bloc.dart'
    as _i6;
import 'package:core/utils/failure.dart' as _i11;
import 'package:dartz/dartz.dart' as _i7;
import 'package:flutter_bloc/flutter_bloc.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetWatchlistMovies_0 extends _i1.Fake
    implements _i2.GetWatchlistMovies {}

class _FakeGetWatchListStatus_1 extends _i1.Fake
    implements _i3.GetWatchListStatus {}

class _FakeSaveWatchlist_2 extends _i1.Fake implements _i4.SaveWatchlist {}

class _FakeRemoveWatchlist_3 extends _i1.Fake implements _i5.RemoveWatchlist {}

class _FakeMovieWatchlistState_4 extends _i1.Fake
    implements _i6.MovieWatchlistState {}

class _FakeEither_5<L, R> extends _i1.Fake implements _i7.Either<L, R> {}

class _FakeMovieRepository_6 extends _i1.Fake implements _i8.MovieRepository {}

/// A class which mocks [MovieWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieWatchlistBloc extends _i1.Mock
    implements _i6.MovieWatchlistBloc {
  MockMovieWatchlistBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetWatchlistMovies get getWatchlistMovies =>
      (super.noSuchMethod(Invocation.getter(#getWatchlistMovies),
          returnValue: _FakeGetWatchlistMovies_0()) as _i2.GetWatchlistMovies);
  @override
  _i3.GetWatchListStatus get getWatchListStatus =>
      (super.noSuchMethod(Invocation.getter(#getWatchListStatus),
          returnValue: _FakeGetWatchListStatus_1()) as _i3.GetWatchListStatus);
  @override
  _i4.SaveWatchlist get saveWatchlist =>
      (super.noSuchMethod(Invocation.getter(#saveWatchlist),
          returnValue: _FakeSaveWatchlist_2()) as _i4.SaveWatchlist);
  @override
  _i5.RemoveWatchlist get removeWatchlist =>
      (super.noSuchMethod(Invocation.getter(#removeWatchlist),
          returnValue: _FakeRemoveWatchlist_3()) as _i5.RemoveWatchlist);
  @override
  _i6.MovieWatchlistState get state => (super.noSuchMethod(
      Invocation.getter(#state),
      returnValue: _FakeMovieWatchlistState_4()) as _i6.MovieWatchlistState);
  @override
  _i9.Stream<_i6.MovieWatchlistState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i6.MovieWatchlistState>.empty())
          as _i9.Stream<_i6.MovieWatchlistState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i6.MovieWatchlistEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i6.MovieWatchlistEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i6.MovieWatchlistState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i6.MovieWatchlistEvent>(
          _i10.EventHandler<E, _i6.MovieWatchlistState>? handler,
          {_i10.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i10.Transition<_i6.MovieWatchlistEvent, _i6.MovieWatchlistState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i9.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  void onChange(_i10.Change<_i6.MovieWatchlistState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}

/// A class which mocks [GetWatchlistMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistMovies extends _i1.Mock
    implements _i2.GetWatchlistMovies {
  MockGetWatchlistMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i7.Either<_i11.Failure, List<_i12.Movie>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i7.Either<_i11.Failure, List<_i12.Movie>>>.value(
              _FakeEither_5<_i11.Failure, List<_i12.Movie>>())) as _i9
          .Future<_i7.Either<_i11.Failure, List<_i12.Movie>>>);
}

/// A class which mocks [GetWatchListStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatus extends _i1.Mock
    implements _i3.GetWatchListStatus {
  MockGetWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_6()) as _i8.MovieRepository);
  @override
  _i9.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
}

/// A class which mocks [RemoveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlist extends _i1.Mock implements _i5.RemoveWatchlist {
  MockRemoveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_6()) as _i8.MovieRepository);
  @override
  _i9.Future<_i7.Either<_i11.Failure, String>> execute(
          _i13.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i7.Either<_i11.Failure, String>>.value(
                  _FakeEither_5<_i11.Failure, String>()))
          as _i9.Future<_i7.Either<_i11.Failure, String>>);
}

/// A class which mocks [SaveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlist extends _i1.Mock implements _i4.SaveWatchlist {
  MockSaveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_6()) as _i8.MovieRepository);
  @override
  _i9.Future<_i7.Either<_i11.Failure, String>> execute(
          _i13.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i7.Either<_i11.Failure, String>>.value(
                  _FakeEither_5<_i11.Failure, String>()))
          as _i9.Future<_i7.Either<_i11.Failure, String>>);
}
