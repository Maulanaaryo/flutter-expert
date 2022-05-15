part of 'tv_series_recommendation_bloc.dart';

abstract class TvSeriesRecommendationState extends Equatable {
  const TvSeriesRecommendationState();

  @override
  List<Object> get props => [];
}

class TvRecommendationEmpty extends TvSeriesRecommendationState {}

class TvRecommendationLoading extends TvSeriesRecommendationState {}

class TvRecommendationError extends TvSeriesRecommendationState {
  final String message;

  const TvRecommendationError(this.message);

  @override
  List<Object> get props => [message];
}

class TvRecommendationLoaded extends TvSeriesRecommendationState {
  final List<TvSeries> tv;

  const TvRecommendationLoaded(this.tv);

  @override
  List<Object> get props => [tv];
}