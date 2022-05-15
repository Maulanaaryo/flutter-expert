part of 'tv_series_watchlist_bloc.dart';

abstract class TvSeriesWatchlistEvent extends Equatable {
  const TvSeriesWatchlistEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends TvSeriesWatchlistEvent {}

class GetStatusTvEvent extends TvSeriesWatchlistEvent {
  final int id;

  const GetStatusTvEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddItemTvEvent extends TvSeriesWatchlistEvent {
  final TvSeriesDetail tvDetail;

  const AddItemTvEvent(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class RemoveItemTvEvent extends TvSeriesWatchlistEvent {
  final TvSeriesDetail tvDetail;

  const RemoveItemTvEvent(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}