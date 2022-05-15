part of 'tv_series_on_air_bloc.dart';

abstract class TvSeriesOnAirEvent extends Equatable {
  const TvSeriesOnAirEvent();

  @override
  List<Object> get props => [];
}

class TvOnAirGetEvent extends TvSeriesOnAirEvent {}