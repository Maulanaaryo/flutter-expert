part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class DetailMovieEmpty extends MovieDetailState {}

class DetailMovieLoading extends MovieDetailState {}

class DetailMovieError extends MovieDetailState {
  final String message;

  const DetailMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailMovieLoaded extends MovieDetailState {
  final MovieDetail movieDetail;

  const DetailMovieLoaded(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}