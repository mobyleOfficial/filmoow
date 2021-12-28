import 'package:dio/dio.dart';
import 'package:filmoow/data/remote/data_source/home/home_remote_data_source.dart';
import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:filmoow/data/remote/model/news_remote_model.dart';
import 'package:filmoow/data/remote/model/series_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_remote_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<MovieRemoteModel>> getPopularMovie() async {
    final response = await dio.get('/home/popularMovies');

    return (response.data as List)
        .map(
          (movie) => MovieRemoteModel.fromJson(movie),
        )
        .toList();
      //..shuffle();
  }

  @override
  Future<List<NewsRemoteModel>> getLatestNews() async {
    final response = await dio.get('/home/news');

    return (response.data as List)
        .map(
          (movie) => NewsRemoteModel.fromJson(movie),
        )
        .toList();
  }

  @override
  Future<List<ContentListRemoteModel>> getPopularList() async {
    final response = await dio.get('/home/popularLists');

    final popularList = (response.data as List)
        .map(
          (movie) => ContentListRemoteModel.fromJson(movie),
        )
        .toList();

    return popularList;
  }

  @override
  Future<List<SeriesRemoteModel>> getPopularSeries() async {
    final response = await dio.get('/home/popularSeries');

    return (response.data as List)
        .map(
          (movie) => SeriesRemoteModel.fromJson(movie),
        )
        .toList()
      ..shuffle();
  }

  @override
  Future<List<TvShowRemoteModel>> getPopularTvShow() async {
    final response = await dio.get('/home/popularTvShow');

    return (response.data as List)
        .map(
          (movie) => TvShowRemoteModel.fromJson(movie),
        )
        .toList()
      ..shuffle();
  }

  @override
  Future<List<MovieRemoteModel>> getAvailableMovies() async {
    final response = await dio.get('/home/availableCinemaMovies');

    return (response.data as List)
        .map(
          (movie) => MovieRemoteModel.fromJson(movie),
        )
        .toList()
      ..shuffle();
  }

  @override
  Future<List<MovieRemoteModel>> getMoviesComingSoon() async {
    final response = await dio.get('/home/comingSoonMovies');

    return (response.data as List)
        .map(
          (movie) => MovieRemoteModel.fromJson(movie),
        )
        .toList()
      ..shuffle();
  }

  @override
  Future<List<MovieRemoteModel>> getMoviesWeekPremiere() async {
    final response = await dio.get('/home/moviesWeekPremiere');

    return (response.data as List)
        .map(
          (movie) => MovieRemoteModel.fromJson(movie),
        )
        .toList()
      ..shuffle();
  }
}
