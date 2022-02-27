import 'package:dio/dio.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/repository/lists_repository.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:domain/use_case/add_comment_use_case.dart';
import 'package:domain/use_case/change_seen_status_use_case.dart';
import 'package:domain/use_case/get_available_movies_use_case.dart';
import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:domain/use_case/get_content_detail_use_case.dart';
import 'package:domain/use_case/get_latest_news_use_case.dart';
import 'package:domain/use_case/get_movies_coming_soon_use_case.dart';
import 'package:domain/use_case/get_movies_week_premiere_use_case.dart';
import 'package:domain/use_case/get_popular_home_list_use_case.dart';
import 'package:domain/use_case/get_popular_lists_use_case.dart';
import 'package:domain/use_case/get_popular_movie_use_case.dart';
import 'package:domain/use_case/get_popular_series_use_case.dart';
import 'package:domain/use_case/get_popular_tv_show_use_case.dart';
import 'package:domain/use_case/get_recent_lists_use_case.dart';
import 'package:domain/use_case/get_series_list_use_case.dart';
import 'package:domain/use_case/get_treding_lists_use_case.dart';
import 'package:domain/use_case/get_tv_show_list_use_case.dart';
import 'package:domain/use_case/get_user_information_use_case.dart';
import 'package:domain/use_case/get_users_lists_use_case.dart';
import 'package:domain/use_case/sign_in_use_case.dart';
import 'package:filmoow/data/local/secure/auth/auth_secure_data_source.dart';
import 'package:filmoow/data/local/secure/auth/auth_secure_data_source_impl.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source_impl.dart';
import 'package:filmoow/data/remote/data_source/home/home_remote_data_source.dart';
import 'package:filmoow/data/remote/data_source/home/home_remote_data_source_impl.dart';
import 'package:filmoow/data/remote/data_source/lists/lists_remote_data_source.dart';
import 'package:filmoow/data/remote/data_source/lists/lists_remote_data_source_impl.dart';
import 'package:filmoow/data/remote/data_source/user/user_remote_data_source.dart';
import 'package:filmoow/data/remote/data_source/user/user_remote_data_source_impl.dart';
import 'package:filmoow/data/repository/auth_repository_impl.dart';
import 'package:filmoow/data/repository/content_repository_impl.dart';
import 'package:filmoow/data/repository/home_repository_impl.dart';
import 'package:filmoow/data/repository/lists_repository_impl.dart';
import 'package:filmoow/data/repository/user_repository_impl.dart';
import 'package:filmoow/infrastructure/remote/auth_interceptor.dart';
import 'package:filmoow/infrastructure/remote/custom_dio.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/comment/comment_list_container.dart';
import 'package:filmoow/presentation/content/content_container.dart';
import 'package:filmoow/presentation/content/content_detail/content_detail_container.dart';
import 'package:filmoow/presentation/home/home_container.dart';
import 'package:filmoow/presentation/lists/lists_container.dart';
import 'package:filmoow/presentation/main/main_screen.dart';
import 'package:filmoow/presentation/profile/filmow_sign_in/filmow_sign_in_container.dart';
import 'package:filmoow/presentation/profile/profile/profile_container.dart';
import 'package:filmoow/presentation/profile/sign_in/sign_in_container.dart';
import 'package:filmoow/presentation/user_list/user_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:domain/use_case/get_movie_list_use_case.dart';

class FilmoowGeneralProvider extends StatelessWidget {
  const FilmoowGeneralProvider(
    this.builder, {
    Key? key,
  }) : super(key: key);

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<FlutterSecureStorage>(
            create: (_) => const FlutterSecureStorage(),
          ),
          ..._buildSecureDataSourceProviders(),
          _buildDioProvider(),
          ..._buildRouteFactory(),
          ..._buildRemoteDataSourceProviders(),
          ..._buildRepositoryProviders(),
          ..._buildUseCaseProviders(),
        ],
        child: builder(context),
      );

  List<SingleChildWidget> _buildSecureDataSourceProviders() => [
        ProxyProvider<FlutterSecureStorage, AuthSecureDataSource>(
          update: (_, dataSource, __) => AuthSecureDataSourceImpl(
            dataSource,
          ),
        ),
      ];

  SingleChildWidget _buildDioProvider() =>
      ProxyProvider<AuthSecureDataSource, Dio>(
        update: (_, authSecureDataSource, __) {
          BaseOptions options = BaseOptions(
            //baseUrl: 'https://filnow.herokuapp.com'
            baseUrl: 'http://192.168.56.1:8080',
          );

          return CustomDio(options)
            ..interceptors.add(
              AuthInterceptor(
                authSecureDataSource,
              ),
            );
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
        ProxyProvider<Dio, UserRemoteDataSource>(
          update: (_, dio, __) => UserRemoteDataSourceImpl(
            dio: dio,
          ),
        ),
        ProxyProvider<Dio, ListsRemoteDataSource>(
          update: (_, dio, __) => ListsRemoteDataSourceImpl(
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
        ProxyProvider<AuthSecureDataSource, AuthRepository>(
          update: (_, secureDataSource, __) => AuthRepositoryImpl(
            secureDataSource: secureDataSource,
          ),
        ),
        ProxyProvider2<AuthSecureDataSource, UserRemoteDataSource,
            UserRepository>(
          update: (_, secureDataSource, userRemoteDataSource, __) =>
              UserRepositoryImpl(
            secureDataSource: secureDataSource,
            userRemoteDataSource: userRemoteDataSource,
          ),
        ),
        ProxyProvider<ListsRemoteDataSource, ListsRepository>(
          update: (_, remoteDataSource, __) => ListsRepositoryImpl(
            remoteDataSource: remoteDataSource,
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
        ProxyProvider<HomeRepository, GetPopularHomeListUseCase>(
          update: (_, repository, __) => GetPopularHomeListUseCase(
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
        ProxyProvider<AuthRepository, SignInUseCase>(
          update: (_, repository, __) => SignInUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<UserRepository, GetUserInformationUseCase>(
          update: (_, repository, __) => GetUserInformationUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, GetCommentListUseCase>(
          update: (_, repository, __) => GetCommentListUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, AddCommentUseCase>(
          update: (_, repository, __) => AddCommentUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ListsRepository, GetRecentListsUseCase>(
          update: (_, repository, __) => GetRecentListsUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ListsRepository, GetTrendingListsUseCase>(
          update: (_, repository, __) => GetTrendingListsUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ListsRepository, GetPopularListsUseCase>(
          update: (_, repository, __) => GetPopularListsUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<UserRepository, GetUserListsUseCase>(
          update: (_, repository, __) => GetUserListsUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, GetMovieListUseCase>(
          update: (_, repository, __) => GetMovieListUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, GetSeriesListUseCase>(
          update: (_, repository, __) => GetSeriesListUseCase(
            repository: repository,
          ),
        ),
        ProxyProvider<ContentRepository, GetTvShowListUseCase>(
          update: (_, repository, __) => GetTvShowListUseCase(
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
                builder: (_) => ContentContainer.create(),
              );
            }

            if (settings.name == RouteNameBuilder.getListsRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => ListsContainer.create(),
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

            if (settings.name == RouteNameBuilder.getProfileRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => ProfileContainer.create(),
              );
            }

            if (settings.name == RouteNameBuilder.getContentDetailRoute()) {
              var id = settings.arguments as String;

              return MaterialPageRoute(
                settings: settings,
                builder: (_) => ContentDetailContainer.create(id),
              );
            }

            if (settings.name == RouteNameBuilder.getFilmowSignInRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => FilmowSignInContainer.create(),
              );
            }

            if (settings.name == RouteNameBuilder.getSignInRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => SignInContainer.create(),
              );
            }

            if (settings.name == RouteNameBuilder.getCommentListRoute()) {
              var id = settings.arguments as String;

              return MaterialPageRoute(
                settings: settings,
                builder: (_) => CommentListContainer.create(id),
              );
            }

            if (settings.name == RouteNameBuilder.getUserListRoute()) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => UserListContainer.create(),
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
