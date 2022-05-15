part of 'tv_series_watchlist_bloc.dart';

abstract class TvSeriesWatchlistState extends Equatable {
  const TvSeriesWatchlistState();

  @override
  List<Object> get props => [];
}

class TvWatchlistEmpty extends TvSeriesWatchlistState {}

class TvWatchlistLoading extends TvSeriesWatchlistState {}

class TvWatchlistError extends TvSeriesWatchlistState {
  final String message;

  const TvWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class TvWatchlistSuccess extends TvSeriesWatchlistState {
  final String message;

  const TvWatchlistSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class TvWatchlistLoaded extends TvSeriesWatchlistState {
  final List<TvSeries> result;

  const TvWatchlistLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class TvWatchlistStatusLoaded extends TvSeriesWatchlistState {
  final bool result;

  const TvWatchlistStatusLoaded(this.result);

  @override
  List<Object> get props => [result];
}