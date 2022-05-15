part of 'tv_series_recommendation_bloc.dart';

abstract class TvSeriesRecommendationEvent extends Equatable {
  const TvSeriesRecommendationEvent();

  @override
  List<Object> get props => [];
}

class GetTvRecommendationEvent extends TvSeriesRecommendationEvent {
  final int id;

  const GetTvRecommendationEvent(this.id);

  @override
  List<Object> get props => [];
}