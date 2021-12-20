import 'package:dio/dio.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/use_case/change_seen_status_use_case.dart';
import 'package:domain/use_case/get_available_movies_use_case.dart';
import 'package:domain/use_case/get_content_detail_use_case.dart';
import 'package:domain/use_case/get_latest_news_use_case.dart';
import 'package:domain/use_case/get_movies_coming_soon_use_case.dart';
import 'package:domain/use_case/get_movies_week_premiere_use_case.dart';
import 'package:domain/use_case/get_popular_list_use_case.dart';
import 'package:domain/use_case/get_popular_movie_use_case.dart';
import 'package:domain/use_case/get_popular_series_use_case.dart';
import 'package:domain/use_case/get_popular_tv_show_use_case.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source_impl.dart';
import 'package:filmoow/data/remote/data_source/home/home_remote_data_source.dart';
import 'package:filmoow/data/remote/data_source/home/home_remote_data_source_impl.dart';
import 'package:filmoow/data/repository/content_repository_impl.dart';
import 'package:filmoow/data/repository/home_repository_impl.dart';
import 'package:filmoow/infrastructure/remote/custom_dio.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/content/content_detail_container.dart';
import 'package:filmoow/presentation/home/home_container.dart';
import 'package:filmoow/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class FilmoowGeneralProvider extends StatelessWidget {
  const FilmoowGeneralProvider(
    this.builder, {
    Key? key,
  }) : super(key: key);

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          _buildDioProvider(),
          ..._buildRouteFactory(),
          ..._buildRemoteDataSourceProviders(),
          ..._buildRepositoryProviders(),
          ..._buildUseCaseProviders(),
        ],
        child: builder(context),
      );

  SingleChildWidget _buildDioProvider() => Provider<Dio>(
        create: (_) {
          BaseOptions options = BaseOptions(
            baseUrl: 'http://192.168.56.1:8080',
          );

          return CustomDio(options);
        },
      );

  List<SingleChildWidget> _buildRemoteDataSourceProviders() => [
        ProxyProvider<Dio, HomeRemoteDataSource>(
          update: (_, dio, __) => HomeRemoteDataSourceImpl(
            dio: dio,
          ),
        ),
        ProxyProvider<Dio, ContentRemoteDataSource>(
          update: (_, dio, __) => ContentRemoteDataSourceImpl(
            dio: dio,
          ),
        ),
      ];

  List<SingleChildWidget> _buildRepositoryProviders() => [
        ProxyProvider<HomeRemoteDataSource, HomeRepository>(
          update: (_, remoteDataSource, __) => HomeRepositoryImpl(
            dataSource: remoteDataSource,
          ),
        ),
        ProxyProvider<ContentRemoteDataSource, ContentRepository>(
          update: (_, remoteDataSource, __) => ContentRepositoryImpl(
            dataSource: remoteDataSource,
          ),
        ),
      ];

  List<SingleChildWidget> _buildUseCaseProviders() => [
        ProxyProvider<HomeRepository, GetPopularMovieUseCase>(
          update: (_, repository, __) => GetPopularMovieUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetMoviesWeekPremiereUseCase>(
          update: (_, repository, __) => GetMoviesWeekPremiereUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetMoviesComingSoonUseCase>(
          update: (_, repository, __) => GetMoviesComingSoonUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetAvailableMovieUseCase>(
          update: (_, repository, __) => GetAvailableMovieUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetPopularTvShowUseCase>(
          update: (_, repository, __) => GetPopularTvShowUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetPopularSeriesUseCase>(
          update: (_, repository, __) => GetPopularSeriesUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetLatestUseCase>(
          update: (_, repository, __) => GetLatestUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<HomeRepository, GetPopularListUseCase>(
          update: (_, repository, __) => GetPopularListUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, GetContentDetailUseCase>(
          update: (_, repository, __) => GetContentDetailUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, ChangeSeenStatusUseCase>(
          update: (_, repository, __) => ChangeSeenStatusUseCase(
            repository: repository,
          ),
        ),
      ];

  List<SingleChildWidget> _buildRouteFactory() => [
        Provider<RouteFactory>(
          create: (_) => (settings) {
            if (settings.name == RouteNameBuilder.getInitialRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => MainScreen.create(),
              );
            }

            if (settings.name == RouteNameBuilder.getHomeRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => HomeContainer.create(),
              );
            }

            if (settings.name == RouteNameBuilder.getContentRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => const Scaffold(
                  body: Text('CONTENT'),
                ),
              );
            }

            if (settings.name == RouteNameBuilder.getListsRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => const Scaffold(
                  body: Text('LISTS'),
                ),
              );
            }

            if (settings.name == RouteNameBuilder.getNewsRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => const Scaffold(
                  body: Text('NEWS'),
                ),
              );
            }

            if (settings.name == RouteNameBuilder.getUserRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => const Scaffold(
                  body: Text('USERS'),
                ),
              );
            }

            if (settings.name == RouteNameBuilder.getContentDetailRoute()) {
              var id = settings.arguments as String;

              return MaterialPageRoute(
                settings: settings,
                builder: (_) => ContentDetailContainer.create(id),
              );
            }

            return MaterialPageRoute(
              settings: settings,
              builder: (_) => Container(),
            );
          },
        ),
      ];
}
