part of 'tv_series_top_rated_bloc.dart';

abstract class TvSeriesTopRatedState extends Equatable {
  const TvSeriesTopRatedState();

  @override
  List<Object> get props => [];
}

class TvTopRatedEmpty extends TvSeriesTopRatedState {}

class TvTopRatedLoading extends TvSeriesTopRatedState {}

class TvTopRatedError extends TvSeriesTopRatedState {
  final String message;

  const TvTopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class TvTopRatedLoaded extends TvSeriesTopRatedState {
  final List<TvSeries> result;

  const TvTopRatedLoaded(this.result);

  @override
  List<Object> get props => [result];
}