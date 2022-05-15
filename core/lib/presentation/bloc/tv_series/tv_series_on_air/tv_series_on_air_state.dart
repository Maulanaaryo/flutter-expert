part of 'tv_series_on_air_bloc.dart';

abstract class TvSeriesOnAirState extends Equatable {
  const TvSeriesOnAirState();

  @override
  List<Object> get props => [];
}

class TvOnAirEmpty extends TvSeriesOnAirState {}

class TvOnAirLoading extends TvSeriesOnAirState {}

class TvOnAirError extends TvSeriesOnAirState {
  final String message;

  const TvOnAirError(this.message);

  @override
  List<Object> get props => [message];
}

class TvOnAirLoaded extends TvSeriesOnAirState {
  final List<TvSeries> result;

  const TvOnAirLoaded(this.result);

  @override
  List<Object> get props => [result];
}