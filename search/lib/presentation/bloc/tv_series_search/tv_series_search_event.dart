part of 'tv_series_search_bloc.dart';

abstract class TvSeriesSearchEvent extends Equatable {
  const TvSeriesSearchEvent();

  @override
  List<Object> get props => [];
}

class TvSearchSetEmpty extends TvSeriesSearchEvent {}

class TvSearchQueryEvent extends TvSeriesSearchEvent {
  final String query;

  const TvSearchQueryEvent(this.query);

  @override
  List<Object> get props => [];
}