part of 'tv_series_search_bloc.dart';

abstract class TvSeriesSearchState extends Equatable {
  const TvSeriesSearchState();

  @override
  List<Object> get props => [];
}

class TvSearchEmpty extends TvSeriesSearchState {}

class TvSearchLoading extends TvSeriesSearchState {}

class TvSearchError extends TvSeriesSearchState {
  final String message;

  const TvSearchError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSearchLoaded extends TvSeriesSearchState {
  final List<TvSeries> result;

  const TvSearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}