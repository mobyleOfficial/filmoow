import 'package:domain/model/content_list.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:filmoow/data/remote/data_source/home/home_remote_data_source.dart';
import 'package:filmoow/data/remote/mappers/remote_to_domain_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({
    required this.dataSource,
  });

  final HomeRemoteDataSource dataSource;

  @override
  Future<List<Movie>> getPopularMovie() async {
    final popularMovieList = await dataSource.getPopularMovie();

    return popularMovieList
        .map(
          (movie) => movie.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<News>> getLatestNews() async {
    final popularNewsList = await dataSource.getLatestNews();

    return popularNewsList
        .map(
          (news) => news.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<ContentList>> getPopularList() async {
    final popularContentList = await dataSource.getPopularList();

    return popularContentList
        .map(
          (list) => list.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Series>> getPopularSeries() async {
    final popularSeriesList = await dataSource.getPopularSeries();

    return popularSeriesList
        .map(
          (series) => series.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<TvShow>> getPopularTvShow() async {
    final popularTvShowList = await dataSource.getPopularTvShow();

    return popularTvShowList
        .map(
          (tvShow) => tvShow.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Movie>> getAvailableMovies() async {
    final popularMovieList = await dataSource.getAvailableMovies();

    return popularMovieList
        .map(
          (movie) => movie.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Movie>> getMoviesComingSoon() async {
    final popularMovieList = await dataSource.getMoviesComingSoon();

    return popularMovieList
        .map(
          (movie) => movie.toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Movie>> getMoviesWeekPremiere() async {
    final popularMovieList = await dataSource.getMoviesWeekPremiere();

    return popularMovieList
        .map(
          (movie) => movie.toDomain(),
        )
        .toList();
  }
}
