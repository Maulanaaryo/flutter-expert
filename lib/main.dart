import 'package:about/about.dart';
import 'package:core/common/utils.dart';
import 'package:core/datasources/ssl/ssl_pinning.dart';
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
import 'package:core/presentation/pages/movie/home_movie_page.dart';
import 'package:core/presentation/pages/movie/movie_detail_page.dart';
import 'package:core/presentation/pages/movie/popular_movies_page.dart';
import 'package:core/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:core/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_home_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_popular_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_top_rated_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_watchlist_page.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:search/presentation/bloc/movie_search/movie_search_bloc.dart';
import 'package:search/presentation/bloc/tv_series_search/tv_series_search_bloc.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:search/presentation/pages/tv_series_search_page.dart';
void main() async {
  WidgetsFlutterBinding?.ensureInitialized();
  await Firebase.initializeApp();
  await SslPinnings.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // bloc movie
        BlocProvider(create: (_) => di.locator<MovieDetailBloc>(),),
        BlocProvider(create: (_) => di.locator<MovieNowPlayingBloc>(),),
        BlocProvider(create: (_) => di.locator<MoviePopularBloc>(),),
        BlocProvider(create: (_) => di.locator<MovieRecommendationBloc>(),),
        BlocProvider(create: (_) => di.locator<MovieSearchBloc>(),),
        BlocProvider(create: (_) => di.locator<MovieTopRatedBloc>(),),
        BlocProvider(create: (_) => di.locator<MovieWatchlistBloc>(),),
        // bloc tv_series
        BlocProvider(create: (_) => di.locator<TvSeriesDetailBloc>(),),
        BlocProvider(create: (_) => di.locator<TvSeriesOnAirBloc>(),),
        BlocProvider(create: (_) => di.locator<TvSeriesPopularBloc>(),),
        BlocProvider(create: (_) => di.locator<TvSeriesRecommendationBloc>(),),
        BlocProvider(create: (_) => di.locator<TvSeriesSearchBloc>(),),
        BlocProvider(create: (_) => di.locator<TvSeriesTopRatedBloc>(),),
        BlocProvider(create: (_) => di.locator<TvSeriesWatchlistBloc>(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case '/tv-home-series':
              return MaterialPageRoute(builder: (_) => TvSeriesHomePage());
            case TvSeriesPopularPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TvSeriesPopularPage());
            case TvSeriesTopRatedPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TvSeriesTopRatedPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case TvSeriesSearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TvSeriesSearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case TvSeriesWatchlistPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => TvSeriesWatchlistPage());

            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
