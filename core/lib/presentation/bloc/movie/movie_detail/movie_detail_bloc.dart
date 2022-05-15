import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc({
    required this.getMovieDetail,
  }) : super(DetailMovieEmpty()) {
    on<GetMovieDetailEvent>((event, emit) async {
      emit(DetailMovieLoading());
      final result = await getMovieDetail.execute(event.id);
      result.fold(
        (failure) {
          emit(DetailMovieError(failure.message));
        },
        (data) {
          emit(DetailMovieLoaded(data));
        },
      );
    });
  }
}