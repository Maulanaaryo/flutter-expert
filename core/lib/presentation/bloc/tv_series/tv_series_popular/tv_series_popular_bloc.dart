import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_popular_event.dart';
part 'tv_series_popular_state.dart';

class TvSeriesPopularBloc extends Bloc<TvSeriesPopularEvent, TvSeriesPopularState> {
  final GetPopularTvSeries getPopularTv;

  TvSeriesPopularBloc(
    this.getPopularTv,
  ) : super(TvPopularEmpty()) {
    on<TvPopularGetEvent>((event, emit) async {
      emit(TvPopularLoading());
      final result = await getPopularTv.execute();
      result.fold(
        (failure) {
          emit(TvPopularError(failure.message));
        },
        (data) {
          emit(TvPopularLoaded(data));
        },
      );
    });
  }
}