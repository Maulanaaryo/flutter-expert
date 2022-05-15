import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_recommendations_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_recommendation_event.dart';
part 'tv_series_recommendation_state.dart';

class TvSeriesRecommendationBloc
    extends Bloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState> {
  final GetRecommendationsTvSeries getTvRecommendations;

  TvSeriesRecommendationBloc({
    required this.getTvRecommendations,
  }) : super(TvRecommendationEmpty()) {
     on<GetTvRecommendationEvent>((event, emit) async {
      emit(TvRecommendationLoading());
      final result = await getTvRecommendations.execute(event.id);
      result.fold(
        (failure) {
          emit(TvRecommendationError(failure.message));
        },
        (data) {
          emit(TvRecommendationLoaded(data));
        },
      );
    });
  }
}