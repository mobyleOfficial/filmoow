import 'package:domain/model/content_list.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:domain/use_case/get_available_movies_use_case.dart';
import 'package:domain/use_case/get_latest_news_use_case.dart';
import 'package:domain/use_case/get_movies_coming_soon_use_case.dart';
import 'package:domain/use_case/get_movies_week_premiere_use_case.dart';
import 'package:domain/use_case/get_popular_list_use_case.dart';
import 'package:domain/use_case/get_popular_movie_use_case.dart';
import 'package:domain/use_case/get_popular_series_use_case.dart';
import 'package:domain/use_case/get_popular_tv_show_use_case.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:filmoow/presentation/home/state/home_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc with SubscriptionHolder {
  HomeBloc({
    required this.getPopularMovieListUseCase,
    required this.getMoviesWeekPremiereUseCase,
    required this.getMoviesComingSoonUseCase,
    required this.getAvailableMovieUseCase,
    required this.getPopularTvShowUseCase,
    required this.getPopularSeriesUseCase,
    required this.getPopularListUseCase,
    required this.getLatestUseCase,
  }) {
    MergeStream([
      _getPopularMovieList(),
    ]).listen(_onNewState.add)
        .addTo(subscriptions);
  }

  final GetPopularMovieUseCase getPopularMovieListUseCase;
  final GetMoviesWeekPremiereUseCase getMoviesWeekPremiereUseCase;
  final GetMoviesComingSoonUseCase getMoviesComingSoonUseCase;
  final GetAvailableMovieUseCase getAvailableMovieUseCase;
  final GetPopularTvShowUseCase getPopularTvShowUseCase;
  final GetPopularSeriesUseCase getPopularSeriesUseCase;
  final GetPopularListUseCase getPopularListUseCase;
  final GetLatestUseCase getLatestUseCase;
  final BehaviorSubject<HomeState> _onNewState = BehaviorSubject<HomeState>();

  Stream<HomeState> get onNewState => _onNewState;

  Stream<HomeState> _getPopularMovieList() async* {
    yield Loading();

    try {
      final popularLists = await Future.wait(
        [
          getPopularMovieListUseCase(),
          getPopularTvShowUseCase(),
          getPopularSeriesUseCase(),
          getPopularListUseCase(),
          getLatestUseCase(),
          getMoviesWeekPremiereUseCase(),
          getMoviesComingSoonUseCase(),
          getAvailableMovieUseCase(),
        ],
        eagerError: true,
      );

      yield Success(
        popularMovieList: popularLists[0] as List<Movie>,
        popularTvShowList: popularLists[1] as List<TvShow>,
        popularSeriesList: popularLists[2] as List<Series>,
        contentListList: popularLists[3] as List<ContentList>,
        latestNewsList: popularLists[4] as List<News>,
        weekPremiereMovieList: popularLists[5] as List<Movie>,
        comingSoonMovieList: popularLists[6] as List<Movie>,
        availableMovieList: popularLists[7] as List<Movie>,
      );
    } catch (error) {
      yield Error();
    }
  }

  void dispose() {
    _onNewState.close();
  }
}
