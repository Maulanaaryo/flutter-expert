import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_top_rated_event.dart';
part 'tv_series_top_rated_state.dart';

class TvSeriesTopRatedBloc extends Bloc<TvSeriesTopRatedEvent, TvSeriesTopRatedState> {
  final GetTopRatedTvSeries getTopRatedTv;

  TvSeriesTopRatedBloc(
    this.getTopRatedTv,
  ) : super(TvTopRatedEmpty()) {
    on<TvTopRatedGetEvent>((event, emit) async {
      emit(TvTopRatedLoading());
      final result = await getTopRatedTv.execute();
      result.fold(
        (failure) {
          emit(TvTopRatedError(failure.message));
        },
        (data) {
          emit(TvTopRatedLoaded(data));
        },
      );
    });
  }
}