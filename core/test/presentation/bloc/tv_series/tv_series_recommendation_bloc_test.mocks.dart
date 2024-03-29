// Mocks generated by Mockito 5.1.0 from annotations
// in core/test/presentation/bloc/tv_series/tv_series_recommendation_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i7;
import 'package:core/domain/entities/tv_series/tv_series_detail.dart' as _i9;
import 'package:core/domain/repositories/tv_series_repository.dart' as _i4;
import 'package:core/domain/usecases/tv_series/get_recommendations_tv_series.dart'
    as _i2;
import 'package:core/presentation/bloc/tv_series/tv_series_recommendation/tv_series_recommendation_bloc.dart'
    as _i3;
import 'package:core/utils/failure.dart' as _i8;
import 'package:dartz/dartz.dart' as _i5;
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

class _FakeGetRecommendationsTvSeries_0 extends _i1.Fake
    implements _i2.GetRecommendationsTvSeries {}

class _FakeTvSeriesRecommendationState_1 extends _i1.Fake
    implements _i3.TvSeriesRecommendationState {}

class _FakeTvRepository_2 extends _i1.Fake implements _i4.TvRepository {}

class _FakeEither_3<L, R> extends _i1.Fake implements _i5.Either<L, R> {}

/// A class which mocks [TvSeriesRecommendationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRecommendationBloc extends _i1.Mock
    implements _i3.TvSeriesRecommendationBloc {
  MockTvSeriesRecommendationBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetRecommendationsTvSeries get getTvRecommendations =>
      (super.noSuchMethod(Invocation.getter(#getTvRecommendations),
              returnValue: _FakeGetRecommendationsTvSeries_0())
          as _i2.GetRecommendationsTvSeries);
  @override
  _i3.TvSeriesRecommendationState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeTvSeriesRecommendationState_1())
          as _i3.TvSeriesRecommendationState);
  @override
  _i6.Stream<_i3.TvSeriesRecommendationState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.TvSeriesRecommendationState>.empty())
          as _i6.Stream<_i3.TvSeriesRecommendationState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i3.TvSeriesRecommendationEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i3.TvSeriesRecommendationEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i3.TvSeriesRecommendationState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i3.TvSeriesRecommendationEvent>(
          _i7.EventHandler<E, _i3.TvSeriesRecommendationState>? handler,
          {_i7.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i7.Transition<_i3.TvSeriesRecommendationEvent,
                  _i3.TvSeriesRecommendationState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i3.TvSeriesRecommendationState>? change) =>
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

/// A class which mocks [GetRecommendationsTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetRecommendationsTvSeries extends _i1.Mock
    implements _i2.GetRecommendationsTvSeries {
  MockGetRecommendationsTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvRepository_2()) as _i4.TvRepository);
  @override
  _i6.Future<_i5.Either<_i8.Failure, List<_i9.TvSeries>>> execute(dynamic id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
              returnValue:
                  Future<_i5.Either<_i8.Failure, List<_i9.TvSeries>>>.value(
                      _FakeEither_3<_i8.Failure, List<_i9.TvSeries>>()))
          as _i6.Future<_i5.Either<_i8.Failure, List<_i9.TvSeries>>>);
}
