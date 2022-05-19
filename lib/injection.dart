
import 'package:core/data/repositories/movie_repository_impl.dart';
import 'package:core/data/repositories/tv_series_repository_impl.dart';
import 'package:core/datasources/db/database_helper.dart';
import 'package:core/datasources/db/database_helper_tv.dart';
import 'package:core/datasources/movie/movie_local_data_source.dart';
import 'package:core/datasources/movie/movie_remote_data_source.dart';
import 'package:core/datasources/ssl/ssl_pinning.dart';
import 'package:core/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:core/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_watchlist.dart';
import 'package:core/domain/usecases/movie/save_watchlist.dart';
import 'package:core/domain/usecases/tv_series/get_detail_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_recommendations_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/save_watchlist_tv_series.dart';
import 'package:core/presentation/bloc/movie/movie_detail/movie_detail_bloc.dart';
import 'package:core/presentation/bloc/movie/movie_popular/movie_popular_bloc.dart';
import 'package:core/presentation/bloc/movie/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:core/presentation/bloc/movie/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:core/presentation/bloc/movie/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:core/presentation/bloc/movie/now_playing/movie_now_playing_bloc.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_detail/tv_series_detail_bloc.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_on_air/tv_series_on_air_bloc.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_popular/tv_series_popular_bloc.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_recommendation/tv_series_recommendation_bloc.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_top_rated/tv_series_top_rated_bloc.dart';
import 'package:core/presentation/bloc/tv_series/tv_series_watchlist/tv_series_watchlist_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:search/presentation/bloc/movie_search/movie_search_bloc.dart';
import 'package:search/presentation/bloc/tv_series_search/tv_series_search_bloc.dart';



final locator = GetIt.instance;

void init() {
  // bloc movie
  locator.registerFactory(() => MovieDetailBloc(getMovieDetail: locator(),),);
  locator.registerFactory(() => MovieNowPlayingBloc(locator(),),);
  locator.registerFactory(() => MoviePopularBloc(locator(),),);
  locator.registerFactory(() => MovieRecommendationBloc(getMovieRecommendations: locator(),),);
  locator.registerFactory(() => MovieSearchBloc(locator(),),);
  locator.registerFactory(() => MovieTopRatedBloc(locator(),),);
  locator.registerFactory(() => MovieWatchlistBloc(
    getWatchlistMovies: locator(), 
    getWatchListStatus: locator(), 
    saveWatchlist: locator(), 
    removeWatchlist: locator(),),);
  // bloc tv_series
  locator.registerFactory(() => TvSeriesDetailBloc(getTvDetail: locator(),),);
  locator.registerFactory(() => TvSeriesOnAirBloc(locator(),),);
  locator.registerFactory(() => TvSeriesPopularBloc(locator(),),);
  locator.registerFactory(() => TvSeriesRecommendationBloc(getTvRecommendations: locator(),),);
  locator.registerFactory(() => TvSeriesSearchBloc(locator(),),);
  locator.registerFactory(() => TvSeriesTopRatedBloc(locator(),),);
  locator.registerFactory(() => TvSeriesWatchlistBloc(
    getWatchlistTv: locator(), 
    getWatchListStatus: locator(), 
    saveWatchlist: locator(), 
    removeWatchlist: locator(),),);

  // use case movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  // use cases tv_series
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetDetailTvSeries(locator()));
  locator.registerLazySingleton(() => GetRecommendationsTvSeries(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository movie
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  // repository tv_series
  locator.registerLazySingleton<TvRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources movie
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  // data sources tv_series
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelpertv: locator()));

  // helper movie
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  // helper tv_series
  locator.registerLazySingleton<DatabaseHelperTv>(() => DatabaseHelperTv());

  // external
  locator.registerLazySingleton(() => SslPinning.client);
}
