part of 'tv_series_popular_bloc.dart';

abstract class TvSeriesPopularState extends Equatable {
  const TvSeriesPopularState();

  @override
  List<Object> get props => [];
}

class TvPopularEmpty extends TvSeriesPopularState {}

class TvPopularLoading extends TvSeriesPopularState {}

class TvPopularError extends TvSeriesPopularState {
  final String message;

  const TvPopularError(this.message);

  @override
  List<Object> get props => [message];
}

class TvPopularLoaded extends TvSeriesPopularState {
  final List<TvSeries> result;

  const TvPopularLoaded(this.result);

  @override
  List<Object> get props => [result];
}