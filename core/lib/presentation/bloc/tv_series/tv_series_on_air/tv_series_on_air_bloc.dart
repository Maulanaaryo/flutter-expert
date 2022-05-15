import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_series_on_air_event.dart';
part 'tv_series_on_air_state.dart';

class TvSeriesOnAirBloc extends Bloc<TvSeriesOnAirEvent, TvSeriesOnAirState> {
  final GetNowPlayingTvSeries getOnAirTv;

  TvSeriesOnAirBloc(
    this.getOnAirTv,
  ) : super(TvOnAirEmpty()) {
    on<TvOnAirGetEvent>((event, emit) async {
      emit(TvOnAirLoading());
      final result = await getOnAirTv.execute();
      result.fold(
        (failure) {
          emit(TvOnAirError(failure.message));
        },
        (data) {
          emit(TvOnAirLoaded(data));
        },
      );
    });
  }
}