import 'package:domain/use_case/get_available_movies_use_case.dart';
import 'package:domain/use_case/get_latest_news_use_case.dart';
import 'package:domain/use_case/get_movies_coming_soon_use_case.dart';
import 'package:domain/use_case/get_movies_week_premiere_use_case.dart';
import 'package:domain/use_case/get_popular_home_list_use_case.dart';
import 'package:domain/use_case/get_popular_movie_use_case.dart';
import 'package:domain/use_case/get_popular_series_use_case.dart';
import 'package:domain/use_case/get_popular_tv_show_use_case.dart';
import 'package:filmoow/presentation/common/async_snapshot_response_view.dart';
import 'package:filmoow/presentation/common/generic_error_empty_state.dart';
import 'package:filmoow/presentation/home/home_bloc.dart';
import 'package:filmoow/presentation/home/home_page.dart';
import 'package:filmoow/presentation/home/state/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider5<
          GetPopularMovieUseCase,
          GetPopularTvShowUseCase,
          GetPopularSeriesUseCase,
          GetLatestUseCase,
          GetPopularHomeListUseCase,
          HomeBloc>(
        update: (
          context,
          getPopularMovieListUseCase,
          getPopularTvShowUseCase,
          getPopularSeriesUseCase,
          getLatestUseCase,
          getPopularListUseCase,
          bloc,
        ) =>
            bloc ??
            HomeBloc(
              getPopularMovieListUseCase: getPopularMovieListUseCase,
              getPopularTvShowUseCase: getPopularTvShowUseCase,
              getPopularSeriesUseCase: getPopularSeriesUseCase,
              getPopularListUseCase: getPopularListUseCase,
              getLatestUseCase: getLatestUseCase,
              getAvailableMovieUseCase:
                  Provider.of<GetAvailableMovieUseCase>(context),
              getMoviesComingSoonUseCase:
                  Provider.of<GetMoviesComingSoonUseCase>(context),
              getMoviesWeekPremiereUseCase:
                  Provider.of<GetMoviesWeekPremiereUseCase>(context),
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<HomeBloc>(
          builder: (_, bloc, __) => HomeContainer(
            bloc: bloc,
          ),
        ),
      );

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<HomeState>(
          stream: bloc.onNewState,
          builder: (_, snapshot) =>
              AsyncSnapshotResponseView<Loading, Success, Error>(
            snapshot: snapshot,
            successWidgetBuilder: (success) => HomePage(
              popularMovieList: success.popularMovieList,
              popularTvShowList: success.popularTvShowList,
              popularSeriesList: success.popularSeriesList,
              contentListList: success.contentListList,
              latestNewsList: success.latestNewsList,
              weekPremiereMovieList: success.weekPremiereMovieList,
              comingSoonMovieList: success.comingSoonMovieList,
              availableMovieList: success.availableMovieList,
            ),
            errorWidgetBuilder: (_) => GenericErrorEmptyState(
              onTryAgain: () {},
              appBarTitle: '',
            ),
          ),
        ),
      );
}
